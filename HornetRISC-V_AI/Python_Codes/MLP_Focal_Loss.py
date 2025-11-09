# ==============================================================================
# REQUIRED LIBRARIES
# ==============================================================================
import pandas as pd
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, BatchNormalization, Input
from tensorflow.keras.optimizers import Adam
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder, StandardScaler, LabelEncoder
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import matplotlib.pyplot as plt

# ==============================================================================
# DATA PREPROCESSING
# ==============================================================================

# Define the column names for the NSL-KDD dataset
column_names = [
    "duration","protocol_type","service","flag","src_bytes","dst_bytes","land",
    "wrong_fragment","urgent","hot","num_failed_logins","logged_in","num_compromised",
    "root_shell","su_attempted","num_root","num_file_creations","num_shells",
    "num_access_files","num_outbound_cmds","is_host_login","is_guest_login","count",
    "srv_count","serror_rate","srv_serror_rate","rerror_rate","srv_rerror_rate",
    "same_srv_rate","diff_srv_rate","srv_diff_host_rate","dst_host_count",
    "dst_host_srv_count","dst_host_same_srv_rate","dst_host_diff_srv_rate",
    "dst_host_same_src_port_rate","dst_host_srv_diff_host_rate",
    "dst_host_serror_rate","dst_host_srv_serror_rate","dst_host_rerror_rate",
    "dst_host_srv_rerror_rate","label", "difficulty"
]

# --- LOCAL FILE PATHS ---
# Load datasets directly from the local file system.
train_path = "KDDTrain+.csv"
test_path = "KDDTest+.csv"

df_train = pd.read_csv(train_path, header=None, names=column_names)
df_test = pd.read_csv(test_path, header=None, names=column_names)
# ------------------------

# The 'difficulty' column is not required for model training and is dropped.
df_train.drop("difficulty", axis=1, inplace=True)
df_test.drop("difficulty", axis=1, inplace=True)

print('Dimensions of the Training set:', df_train.shape)
print('Dimensions of the Test set:', df_test.shape)

# Check for missing values 
print("\nChecking for Null Values:")
print(f"Total Null values in Training set: {df_train.isna().sum().sum()}")
print(f"Total Null values in Test set: {df_test.isna().sum().sum()}")


def group_attack_labels(df):
    """
    Groups the 42 unique attack labels into 5 main categories (DoS, R2L, Probe, U2R, Normal).
    Fixes the Pandas SettingWithCopyWarning by explicitly assigning the modified series back.
    """
    labels = df['label'].copy()

    # Denial of Service (DoS) attacks
    labels.replace([
        'apache2','back','land','neptune','mailbomb','pod','processtable',
        'smurf','teardrop','udpstorm','worm'
    ], 'DoS', inplace=True)

    # Remote to Local (R2L) attacks
    labels.replace([
        'ftp_write','guess_passwd','httptunnel','imap','multihop','named','phf',
        'sendmail','snmpgetattack','snmpguess','spy','warezclient','warezmaster',
        'xlock','xsnoop'
    ], 'R2L', inplace=True)

    # Probing attacks
    labels.replace([
        'ipsweep','mscan','nmap','portsweep','saint','satan'
    ], 'Probe', inplace=True)

    # User to Root (U2R) attacks
    labels.replace([
        'buffer_overflow','loadmodule','perl','ps','rootkit','sqlattack','xterm'
    ], 'U2R', inplace=True)
    
    df['label'] = labels # Assign the modified series back to the DataFrame
    
group_attack_labels(df_train)
group_attack_labels(df_test)


# Separate features (X) and labels (y)
X_train = df_train.drop(['label'], axis=1)
y_train = df_train['label']
X_test = df_test.drop(['label'], axis=1)
y_test = df_test['label']


# ==============================================================================
# FEATURE ENGINEERING: ENCODING AND SCALING
# ==============================================================================

# Identify categorical and numerical columns for preprocessing
categorical_cols = ['protocol_type', 'service', 'flag']
numerical_cols = [col for col in X_train.columns if col not in categorical_cols]

preprocessor = ColumnTransformer(
    transformers=[
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_cols),
        ('num', StandardScaler(), numerical_cols)
    ]
)

# Crucial Step: Fit the preprocessor ONLY on the training data, then transform both
X_train_processed = preprocessor.fit_transform(X_train)
X_test_processed = preprocessor.transform(X_test)

# FIX: Convert the sparse matrices to dense NumPy arrays immediately.
# This prevents the AttributeError later in the sampling functions.
if hasattr(X_train_processed, 'toarray'):
    X_train_processed = X_train_processed.toarray()
if hasattr(X_test_processed, 'toarray'):
    X_test_processed = X_test_processed.toarray()


# Label Encoding for output classes (y_train, y_test)
le = LabelEncoder()
le.fit(pd.concat([df_train['label'], df_test['label']], axis=0))

y_train_encoded = le.transform(df_train['label'])
y_test_encoded = le.transform(df_test['label'])

# Convert integer labels to one-hot categorical format for Keras/TensorFlow
num_classes = len(le.classes_)
y_train_cat = tf.keras.utils.to_categorical(y_train_encoded, num_classes=num_classes)
y_test_cat = tf.keras.utils.to_categorical(y_test_encoded, num_classes=num_classes)


# Display the class-to-integer mapping for verification
print("\nClass-to-Integer Mapping:")
for i, cls in enumerate(le.classes_):
    print(f"{i} -> {cls}")

print('\nDimensions of the Processed Training set:', X_train_processed.shape)
print('Dimensions of the Processed Test set:', X_test_processed.shape)


# ==============================================================================
# UTILITY FUNCTION: EXTRACT SINGLE PRE-PROCESSED INPUT
# ==============================================================================

def get_sample_vector(row_idx=None, class_name=None, class_instance=0):
    """
    Extracts and prints a single pre-processed input vector in C-style array format.
    """

    if row_idx is not None:
        idx = row_idx
    elif class_name is not None:
        encoded_class = le.transform([class_name])[0]
        indices = np.where(y_test_encoded == encoded_class)[0]
        
        if len(indices) == 0:
            raise ValueError(f"No samples found for class '{class_name}'")
        if class_instance >= len(indices):
            raise ValueError(f"Requested instance {class_instance} (0-indexed) "
                             f"but only {len(indices)} samples exist for class '{class_name}'")
        idx = indices[class_instance]
    else:
        raise ValueError("You must specify either row_idx or class_name.")

    # FIX: X_test_processed is now a dense array, so we don't need .toarray()
    row_dense = X_test_processed[idx].flatten()

    print("\n// C-Style Input Vector")
    print("{")
    print(", ".join([f"{x:.6f}f" for x in row_dense]))
    print("};")

    true_label_enc = y_test_encoded[idx]
    true_label_name = le.inverse_transform([true_label_enc])[0]
    print(f"\nRow index (in X_test_processed): {idx}")
    print(f"True label (encoded): {true_label_enc}")
    print(f"Label name: {true_label_name}")

# Example usage: Extract and print one sample for each major class
print("\n" + "="*50)
print("EXTRACTING SAMPLE INPUT VECTORS FOR C/VERILOG DEBUGGING")
get_sample_vector(class_name="normal", class_instance=0)
get_sample_vector(class_name="DoS", class_instance=0)
get_sample_vector(class_name="Probe", class_instance=0)
get_sample_vector(class_name="R2L", class_instance=99)
get_sample_vector(class_name="U2R", class_instance=0)
print("="*50)


def save_full_testset(X_test_processed, y_test_encoded,
                      input_file="inputs.txt", label_file="labels.txt"):
    """Saves the full pre-processed test set into text files for hardware simulation."""
    with open(input_file, "w") as f_in, open(label_file, "w") as f_lab:
        for i in range(X_test_processed.shape[0]):
            # FIX: X_test_processed is guaranteed dense here, so no .toarray() needed
            row_dense = X_test_processed[i].flatten()
            row_str = ", ".join([f"{x:.6f}f" for x in row_dense])
            f_in.write("{ " + row_str + " };\n")

            # Write numerical label
            f_lab.write(f"{y_test_encoded[i]}\n")

# Execute: Save the entire test set
save_full_testset(X_test_processed, y_test_encoded)
print("\nFull test set saved to inputs.txt and labels.txt.")


# ==============================================================================
# BUILDING THE MLP MODEL WITH FOCAL LOSS
# ==============================================================================

# Focal Loss is often used for highly imbalanced datasets like NSL-KDD
def focal_loss(gamma=2., alpha=None):
    """Custom Focal Loss implementation for TensorFlow/Keras."""
    alpha = tf.constant(alpha, dtype=tf.float32)

    def loss_fn(y_true, y_pred):
        epsilon = tf.keras.backend.epsilon()
        y_pred = tf.clip_by_value(y_pred, epsilon, 1. - epsilon)
        
        cross_entropy = -y_true * tf.math.log(y_pred)
        alpha_weight = tf.reduce_sum(alpha * y_true, axis=1, keepdims=True)
        focal_weight = tf.math.pow(1 - y_pred, gamma)
        loss = alpha_weight * focal_weight * cross_entropy

        return tf.reduce_mean(tf.reduce_sum(loss, axis=1))

    return loss_fn

# Define the MLP architecture
model = Sequential([
    Input(shape=(X_train_processed.shape[1],), name='input_layer'),

    Dense(256, activation='relu', name='dense_0'),
    BatchNormalization(name='bn_0'),
    Dropout(0.4),

    Dense(128, activation='relu', name='dense_1'),
    BatchNormalization(name='bn_1'),
    Dropout(0.3),

    Dense(64, activation='relu', name='dense_2'),
    BatchNormalization(name='bn_2'),
    Dropout(0.2),

    Dense(32, activation='relu', name='dense_3'),
    BatchNormalization(name='bn_3'),
    Dropout(0.1),

    Dense(num_classes, activation='softmax', name='dense_output')
])

# Compile the model
model.compile(
    optimizer=Adam(learning_rate=1e-4),
    loss=focal_loss(gamma=2, alpha=[0.2, 0.25, 3.0, 1.0, 0.15]),
    metrics=['accuracy']
)

# Train the model
# Using X_train_processed (which is now a dense NumPy array)
history = model.fit(
    X_train_processed, y_train_cat,
    validation_split=0.1,
    epochs=100,
    batch_size=512,
    verbose=2
)

# Evaluate the model
y_pred_probs_mlp = model.predict(X_test_processed, verbose=0)
y_pred_classes_mlp = np.argmax(y_pred_probs_mlp, axis=1)
y_true_classes_mlp = y_test_encoded

print("\n\n" + "="*50)
print("MLP CLASSIFICATION REPORT (TEST SET)")
print(classification_report(y_true_classes_mlp, y_pred_classes_mlp, digits=4))

print("\nConfusion Matrix (MLP):")
print(confusion_matrix(y_true_classes_mlp, y_pred_classes_mlp))

print(f"\nAccuracy (MLP): {accuracy_score(y_true_classes_mlp, y_pred_classes_mlp):.4f}")
print("="*50)


# ==============================================================================
# PARAMETER EXTRACTION FOR C/C++ IMPLEMENTATION
# ==============================================================================

def format_array_to_c_style(arr, array_name, dtype="const float"):
    """
    Converts a NumPy array into a C header file array declaration string.
    """
    flat_arr = arr.flatten()
    c_str = f"{dtype} {array_name}[{len(flat_arr)}] = {{\n"

    for i, val in enumerate(flat_arr):
        c_str += f"    {val:.8f}f"
        if i < len(flat_arr) - 1:
            c_str += ","
        
        if (i + 1) % 10 == 0:
            c_str += "\n"

    c_str = c_str.rstrip(",\n ") + "\n};\n\n"

    return c_str

def extract_and_print_c_parameters(model):
    """
    Extracts all trained weights and Batch Normalization parameters
    and prints them to the console in C header file format.
    """

    # Manually map Keras layer names to C variable prefixes
    layer_map = [
        ('dense_0', 'bn_0', 'layer0', 'bn0'),
        ('dense_1', 'bn_1', 'layer1', 'bn1'),
        ('dense_2', 'bn_2', 'layer2', 'bn2'),
        ('dense_3', 'bn_3', 'layer3', 'bn3'),
        ('dense_output', None, 'layer4', None), # Output layer (no BN)
    ]
    
    output_lines = ["// MLP Lightweight Model Parameters (C Header Format) - Generated by Python\n\n"]
    
    for i, (d_name, bn_name, c_d_prefix, c_bn_prefix) in enumerate(layer_map):
        
        # --- Dense Layer Parameters (Weights and Biases) ---
        try:
            dense_layer = model.get_layer(d_name)
            dense_weights = dense_layer.get_weights()
        except ValueError: continue

        output_lines.append(f"// Layer {i} ({d_name}): Weights ({dense_weights[0].shape[0]}x{dense_weights[0].shape[1]})")
        output_lines.append(format_array_to_c_style(dense_weights[0], f"{c_d_prefix}_weights"))
        
        output_lines.append(f"// Layer {i} ({d_name}): Biases")
        output_lines.append(format_array_to_c_style(dense_weights[1], f"{c_d_prefix}_biases"))

        # --- Batch Normalization Parameters ---
        if bn_name:
            try:
                bn_layer = model.get_layer(bn_name)
                bn_params = bn_layer.get_weights()
            except ValueError: continue

            gamma, beta, mean, variance = bn_params

            output_lines.append(f"// Layer {i} ({bn_name}): Gamma (Scale Factor)")
            output_lines.append(format_array_to_c_style(gamma, f"{c_bn_prefix}_gamma"))
            
            output_lines.append(f"// Layer {i} ({bn_name}): Beta (Shift Factor)")
            output_lines.append(format_array_to_c_style(beta, f"{c_bn_prefix}_beta"))
            
            output_lines.append(f"// Layer {i} ({bn_name}): Moving Mean")
            output_lines.append(format_array_to_c_style(mean, f"{c_bn_prefix}_mean"))
            
            output_lines.append(f"// Layer {i} ({bn_name}): Moving Variance")
            output_lines.append(format_array_to_c_style(variance, f"{c_bn_prefix}_var"))

            epsilon = bn_layer.epsilon
            output_lines.append(f"const float {c_bn_prefix}_eps = {epsilon:.8f}f;\n\n")

    print("\n" + "="*50)
    print("C HEADER PARAMETER OUTPUT (Copy/Paste to your .h file)")
    print("="*50)
    print("\n".join(output_lines))
    print("Extraction complete.")


# Execute parameter extraction
extract_and_print_c_parameters(model)


# ==============================================================================
# VISUALIZATION (Requires Matplotlib)
# ==============================================================================

# Plot accuracy
plt.figure(figsize=(12, 5))
plt.subplot(1, 2, 1)
plt.plot(history.history['accuracy'], label='Train Accuracy')
plt.plot(history.history['val_accuracy'], label='Validation Accuracy')
plt.title("Model Accuracy (MLP)")
plt.xlabel("Epoch")
plt.ylabel("Accuracy")
plt.legend()
plt.grid(True)

# Plot loss
plt.subplot(1, 2, 2)
plt.plot(history.history['loss'], label='Train Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title("Model Loss (MLP)")
plt.xlabel("Epoch")
plt.ylabel("Loss")
plt.legend()
plt.grid(True)
plt.show()

# ==============================================================================
# SAVE MODEL ARCHITECTURE DIAGRAM (Requires pydot and graphviz)
# ==============================================================================
tf.keras.utils.plot_model(
    model, 
    to_file='mlp_architecture.png', 
    show_shapes=True, 
    show_layer_names=True
)