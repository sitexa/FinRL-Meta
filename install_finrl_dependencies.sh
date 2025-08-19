#!/bin/bash
# FinRL-META Dependencies Installation Script
# This script resolves the box2d-py and llvmlite compilation issues

echo "=== FinRL-META Dependencies Installation ==="
echo "Resolving box2d-py and llvmlite compilation issues..."

# Step 1: Install basic dependencies without problematic packages
echo "Step 1: Installing safe dependencies..."
pip install -r requirements_safe.txt

# Step 2: Use conda to install problematic packages (recommended)
echo "Step 2: Installing problematic packages via conda..."
conda install -c conda-forge llvmlite numba box2d-py -y

# Step 3: Install remaining packages
echo "Step 3: Installing remaining packages..."
pip install stable-baselines3 --no-deps
pip install tensorboard

# Step 4: Try to install other packages individually
echo "Step 4: Installing additional packages..."
pip install gym || echo "Warning: gym installation failed, you may need to install it separately"
pip install elegantrl || echo "Warning: elegantrl installation failed, you may need to install it separately"
pip install ray || echo "Warning: ray installation failed, you may need to install it separately"
pip install vectorbt || echo "Warning: vectorbt installation failed, you may need to install it separately"

echo "=== Installation Complete ==="
echo "Note: Some packages may have failed to install due to compilation issues."
echo "The core FinRL functionality should work with the successfully installed packages."
echo "For packages that failed, consider using conda or installing from pre-built wheels."