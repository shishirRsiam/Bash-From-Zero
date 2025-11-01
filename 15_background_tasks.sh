#!/bin/bash

# =============================================================
# 💡 Bash Background Jobs & Logging Demo (All-in-One)
# =============================================================
# This script demonstrates:
# 1. Running tasks in the background
# 2. Using nohup to keep tasks running after logout
# 3. Logging output (stdout & stderr) to a custom log
# 4. Timestamps in logs
# 5. Capturing PID for background jobs
# =============================================================

# -------------------------------
# Helper function: log message
# -------------------------------
log_message() {
    local message="$1"
    local logfile="$2"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message" >> "$logfile"
}

# -------------------------------
# Task 1: Background demo
# -------------------------------
background_task() {
    local logfile="${1:-$HOME/background_demo.log}"
    log_message "Background task started" "$logfile"

    for i in {1..5}; do
        log_message "Background task working... Step $i" "$logfile"
        sleep 2
    done

    log_message "Background task finished" "$logfile"
}

# -------------------------------
# Task 2: Persistent task with nohup
# -------------------------------
persistent_task() {
    local logfile="${1:-$HOME/persistent_demo.log}"
    log_message "Persistent nohup task started" "$logfile"

    for i in {1..5}; do
        log_message "Persistent task working... Step $i" "$logfile"
        sleep 3
    done

    log_message "Persistent nohup task finished" "$logfile"
}

# -------------------------------
# Task 3: Safe division with logging
# -------------------------------
safe_divide_task() {
    local a="$1"
    local b="$2"
    local logfile="${3:-$HOME/divide_demo.log}"

    if [[ $b -eq 0 ]]; then
        log_message "❌ Error: Division by zero!" "$logfile"
        return 1
    fi

    local result=$((a / b))
    log_message "Result of $a / $b = $result" "$logfile"
}

# =============================================================
# 🚀 Run Demo Tasks
# =============================================================

echo "===== Starting Demo Tasks ====="

# 1️⃣ Run background_task in background
background_task "$HOME/demo_background.log" &
BG_PID=$!
echo "Background task running with PID: $BG_PID"

# 2️⃣ Run persistent_task with nohup (keeps running after logout)
nohup bash -c "persistent_task '$HOME/demo_persistent.log'" &> /dev/null &
PERSISTENT_PID=$!
echo "Persistent nohup task running with PID: $PERSISTENT_PID"

# 3️⃣ Run safe_divide_task examples
safe_divide_task 10 2 "$HOME/demo_divide.log"
safe_divide_task 10 0 "$HOME/demo_divide.log"

# 4️⃣ Show logs in real-time (optional, comment out if not needed)
# tail -f "$HOME/demo_background.log" "$HOME/demo_persistent.log" "$HOME/demo_divide.log"

echo "===== Demo Tasks Launched ====="
echo "Check logs:"
echo " - Background log: $HOME/demo_background.log"
echo " - Persistent log: $HOME/demo_persistent.log"
echo " - Division log: $HOME/demo_divide.log"
