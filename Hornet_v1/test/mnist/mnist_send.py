#!/usr/bin/env python3
import argparse
import numpy as np
from PIL import Image
import serial
import time

# --- MNIST loader ---
def load_mnist():
    """
    Returns (x_test, y_test) as numpy arrays.
    Uses tf.keras.datasets just to fetch MNIST. Replace with local npz if you prefer.
    """
    try:
        from tensorflow.keras.datasets import mnist
        (_, _), (x_test, y_test) = mnist.load_data()
        return x_test, y_test
    except Exception as e:
        raise RuntimeError(
            "Failed to load MNIST with tensorflow.keras.datasets. "
            "Install TensorFlow or replace this loader with a local npz."
        ) from e
    # Alt (no TF): after you save locally once as mnist_test.npz
    # data = np.load('mnist_test.npz')
    # return data['x_test'], data['y_test']


def to_14x14_float_bytes(img28, normalize=True):
    """
    img28: 2D uint8 (28x28)
    Returns raw bytes for 196 float32 values in little-endian order (784 bytes).
    """
    pil_img = Image.fromarray(img28)  # mode 'L'
    pil_small = pil_img.resize((14, 14), resample=Image.BILINEAR)

    arr = np.asarray(pil_small, dtype=np.float32)
    if normalize:
        arr = arr / 255.0  # scale to [0,1]

    vec = arr.reshape(-1).astype('<f4')  # explicitly little-endian float32
    return vec.tobytes()  # raw bytes only


def send_one_sample(ser: serial.Serial, payload_bytes: bytes, write_chunk=None, inter_chunk_delay=0.0):
    """
    Send exactly 784 bytes for one sample (optionally chunked).
    """
    if write_chunk is None:
        ser.write(payload_bytes)
    else:
        for i in range(0, len(payload_bytes), write_chunk):
            ser.write(payload_bytes[i:i+write_chunk])
            if inter_chunk_delay > 0:
                time.sleep(inter_chunk_delay)
    ser.flush()


def read_one_prediction(ser: serial.Serial, timeout_s=3.0):
    """
    Read exactly 1 byte as prediction. Returns int 0..255 or None on timeout.
    """
    # Temporarily adjust timeout just for reads (without reopening port)
    old_timeout = ser.timeout
    ser.timeout = timeout_s
    try:
        data = ser.read(1)
        if len(data) == 1:
            return int.from_bytes(data, 'little')
        return None
    finally:
        ser.timeout = old_timeout


def main():
    ap = argparse.ArgumentParser(
        description="Send first 100 MNIST test samples (indices 0..99) as 14x14 float32 vectors over UART and check predictions."
    )
    ap.add_argument("--port", required=True,
                    help="Serial port (e.g., COM6, /dev/ttyUSB0, /dev/ttyACM0)")
    ap.add_argument("--baud", type=int, default=19200,
                    help="Baudrate (default: 19200)")
    ap.add_argument("--normalize", action="store_true",
                    help="Scale pixels to [0,1] (enable if your MLP expects normalization)")
    ap.add_argument("--chunk", type=int, default=0,
                    help="Optional: write in chunks of N bytes (0 = send all at once)")
    ap.add_argument("--delay", type=float, default=0.0,
                    help="Optional: delay between chunks (e.g., 0.001)")
    ap.add_argument("--count", type=int, default=100,
                    help="How many indices to test starting from 0 (default: 100)")
    ap.add_argument("--pred-timeout", type=float, default=3.0,
                    help="Seconds to wait for MCU prediction per sample (default: 3.0)")
    args = ap.parse_args()

    # Load test set
    x_test, y_test = load_mnist()
    n_total = len(x_test)
    n = min(args.count, n_total)
    if n <= 0:
        print("Nothing to send (count <= 0).")
        return

    # Open serial once
    with serial.Serial(
        port=args.port,
        baudrate=args.baud,
        bytesize=serial.EIGHTBITS,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        timeout=1,
        write_timeout=2,
        rtscts=False,
        dsrdtr=False,
    ) as ser:
        # Clear any stale data
        ser.reset_input_buffer()
        ser.reset_output_buffer()

        correct = 0
        wrong = 0

        print(f"Starting batch: sending indices 0..{n-1} (count={n}), baud={args.baud}")
        for idx in range(n):
            img28 = x_test[idx]
            true_label = int(y_test[idx])

            # Convert to 196 float32s (784 bytes)
            raw_bytes = to_14x14_float_bytes(img28, normalize=args.normalize)
            assert len(raw_bytes) == 784

            # Send one sample
            send_one_sample(
                ser,
                raw_bytes,
                write_chunk=(args.chunk if args.chunk and args.chunk > 0 else None),
                inter_chunk_delay=args.delay,
            )

            # Read one prediction byte
            pred = read_one_prediction(ser, timeout_s=args.pred_timeout)

            if pred is None:
                wrong += 1
                print(f"[{idx:04d}] true={true_label}  pred=∅ (timeout)  -> ❌")
            else:
                is_ok = (pred == true_label)
                if is_ok:
                    correct += 1
                else:
                    wrong += 1
                mark = "✅" if is_ok else "❌"
                print(f"[{idx:04d}] true={true_label}  pred={pred}  -> {mark}")

        print("\n=== Summary ===")
        print(f"Total tested: {n}")
        print(f"Correct: {correct}")
        print(f"Wrong:   {wrong}")

if __name__ == "__main__":
    main()
