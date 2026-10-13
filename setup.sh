#!/bin/bash

# Bomber Game Environment Setup Script
# This script creates a Python virtual environment and sets up the project

set -e  # Exit on any error

echo "🚀 Setting up Bomber Game environment..."

# Check if Python 3.13 or newer is available
check_python_version() {
    local python_cmd=$1
    if command -v "$python_cmd" &> /dev/null; then
        local version=$($python_cmd -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
        local major=$(echo $version | cut -d. -f1)
        local minor=$(echo $version | cut -d. -f2)
        
        if [ "$major" -eq 3 ] && [ "$minor" -ge 13 ]; then
            echo "✅ Found suitable Python version: $version"
            echo "$python_cmd"
            return 0
        fi
    fi
    return 1
}

# Find the best Python version
PYTHON_CMD=""
for cmd in python3.13 python3.14 python3.15 python3 python; do
    if PYTHON_CMD=$(check_python_version "$cmd"); then
        break
    fi
done

if [ -z "$PYTHON_CMD" ]; then
    echo "❌ Error: Python 3.13 or newer is required but not found."
    echo "Please install Python 3.13+ from https://www.python.org/downloads/"
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment..."
$PYTHON_CMD -m venv bomber_env

# Activate virtual environment
echo "🔄 Activating virtual environment..."
source bomber_env/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
python -m pip install --upgrade pip

# Install requirements (if any were added to requirements.txt)
if [ -f "requirements.txt" ] && [ -s "requirements.txt" ]; then
    echo "📚 Installing requirements..."
    pip install -r requirements.txt
else
    echo "ℹ️  No additional packages to install (using Python standard library only)"
fi

# Check if tkinter is available
echo "🖼️  Checking tkinter availability..."
if python -c "import tkinter; print('tkinter is available')" 2>/dev/null; then
    echo "✅ tkinter is properly installed and available"
else
    echo "❌ tkinter is not available. Please install it:"
    echo "   - macOS: tkinter should be included with Python"
    echo "   - Ubuntu/Debian: sudo apt-get install python3-tk"
    echo "   - CentOS/RHEL: sudo yum install tkinter"
    echo "   - Arch Linux: sudo pacman -S tk"
    echo "   - Windows: tkinter should be included with Python"
fi

# Test the bomber game
echo "🎮 Testing bomber game..."
if python -c "
import sys
sys.path.append('.')
try:
    from tkinter import Tk
    print('✅ Bomber game dependencies are ready!')
    print('🎯 You can now run: python bomber_oo.py')
except ImportError as e:
    print(f'❌ Import error: {e}')
    sys.exit(1)
"; then
    echo ""
    echo "🎉 Setup complete! Your environment is ready."
    echo ""
    echo "To use this environment:"
    echo "  1. Activate: source bomber_env/bin/activate"
    echo "  2. Run game: python bomber_oo.py"
    echo "  3. When done: deactivate"
    echo ""
    echo "Game controls:"
    echo "  - SPACE: Drop bomb"
    echo "  - Q: Quit game"
    echo "  - R: Restart game"
    echo "  - N: Next level (after winning)"
else
    echo "❌ Setup encountered issues. Please check the error messages above."
    exit 1
fi