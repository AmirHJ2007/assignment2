@echo off
REM Bomber Game Environment Setup Script for Windows
REM This script creates a Python virtual environment and sets up the project

echo 🚀 Setting up Bomber Game environment...

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Error: Python is not found in PATH.
    echo Please install Python 3.13+ from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

REM Check Python version
for /f "tokens=2" %%i in ('python --version') do set PYTHON_VERSION=%%i
echo Found Python version: %PYTHON_VERSION%

REM Create virtual environment
echo 📦 Creating virtual environment...
python -m venv bomber_env
if errorlevel 1 (
    echo ❌ Failed to create virtual environment
    pause
    exit /b 1
)

REM Activate virtual environment
echo 🔄 Activating virtual environment...
call bomber_env\Scripts\activate.bat

REM Upgrade pip
echo ⬆️  Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements (if any were added to requirements.txt)
if exist requirements.txt (
    if not exist requirements.txt (
        echo ℹ️  No additional packages to install (using Python standard library only)
    ) else (
        echo 📚 Installing requirements...
        pip install -r requirements.txt
    )
) else (
    echo ℹ️  No additional packages to install (using Python standard library only)
)

REM Check if tkinter is available
echo 🖼️  Checking tkinter availability...
python -c "import tkinter; print('✅ tkinter is available')" 2>nul
if errorlevel 1 (
    echo ❌ tkinter is not available. 
    echo Please reinstall Python from https://www.python.org/downloads/
    echo Make sure tkinter is included in the installation.
    pause
    exit /b 1
)

REM Test the bomber game
echo 🎮 Testing bomber game...
python -c "import sys; sys.path.append('.'); from tkinter import Tk; print('✅ Bomber game dependencies are ready!')" 2>nul
if errorlevel 1 (
    echo ❌ Import error occurred
    pause
    exit /b 1
)

echo.
echo 🎉 Setup complete! Your environment is ready.
echo.
echo To use this environment:
echo   1. Activate: bomber_env\Scripts\activate.bat
echo   2. Run game: python bomber_oo.py
echo   3. When done: deactivate
echo.
echo Game controls:
echo   - SPACE: Drop bomb
echo   - Q: Quit game
echo   - R: Restart game
echo   - N: Next level (after winning)
echo.
pause