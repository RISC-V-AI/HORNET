def calculate_accuracy(true_file="labels.txt", pred_file="label_results.txt"):
    # Read ground-truth labels
    with open(true_file, "r") as f_true:
        y_true = [int(line.strip()) for line in f_true if line.strip()]

    # Read predicted labels
    with open(pred_file, "r") as f_pred:
        y_pred = [int(line.strip()) for line in f_pred if line.strip()]

    # Sanity check: lengths must match
    if len(y_true) != len(y_pred):
        raise ValueError(f"Length mismatch: {len(y_true)} vs {len(y_pred)}")

    # Count correct predictions
    correct = sum(1 for t, p in zip(y_true, y_pred) if t == p)
    total = len(y_true)

    accuracy = 100.0 * correct / total
    print(f"Correct: {correct}/{total}")
    print(f"Accuracy: {accuracy:.2f}%")

if __name__ == "__main__":
    calculate_accuracy("labels.txt", "label_results.txt")
