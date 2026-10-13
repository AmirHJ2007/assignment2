# ENGF0034 Assignment 2

Welcome to your debugging assignment! This repository contains three implementations of the classic Bomber game that need your debugging skills.

## Quick Start

1. Clone this repository to your local machine
2. Run the setup script for your platform:
   - **macOS/Linux:** `./setup.sh`
   - **Windows:** `setup.bat`
3. Test one of the games: `python bomber_oo.py`
4. Read the full assignment instructions in `assignment2.pdf`

## Prerequisites

- Python 3.13 or newer
- tkinter (usually included with Python)

## Game Files

Choose one of the three implementations to debug:
- `bomber_oo.py` - Object-oriented version
- `bomber_proc.py` - Procedural version  
- `bomber_bigloop.py` - Big loop version

All three games should behave identically but contain **at least five bugs** that make them unplayable!

## Submission Guidelines

Please submit your bug reports as one file (txt or PDF) and your fixed python source code as a second file.  No need to zip them, multiple files can be uploaded.

Upload your completed files directly to Moodle:
👉 [Moodle Assignment 2 Submission Point](https://moodle.ucl.ac.uk/mod/assign/view.php?id=9108700)

## Game Controls

- **SPACE**: Drop bomb
- **Q**: Quit game  
- **R**: Restart game
- **N**: Next level (after winning)

## Your Task

1. Play the game and find bugs (there are at least 5!)
2. Write detailed bug reports for each bug
3. Identify the root causes
4. Fix the bugs in **one** of the three versions
5. Upload your solution files directly to Moodle before the deadline

## Deadline

Tuesday 20th October at 12 noon (midday)

## Troubleshooting

### Setup Issues
If the automatic setup doesn't work:
1. Ensure Python 3.13+ is installed: `python --version`
2. Create virtual environment manually: `python3 -m venv bomber_env`
3. Activate it: `source bomber_env/bin/activate` (macOS/Linux) or `bomber_env\Scripts\activate.bat` (Windows)

### tkinter Issues
If you get tkinter import errors:
- **Ubuntu/Debian:** `sudo apt-get install python3-tk`
- **CentOS/RHEL:** `sudo yum install tkinter`
- **Arch Linux:** `sudo pacman -S tk`
- **macOS/Windows:** tkinter should be included with Python

### Game Won't Run
Test tkinter availability: `python -c "import tkinter; print('tkinter works!')"`