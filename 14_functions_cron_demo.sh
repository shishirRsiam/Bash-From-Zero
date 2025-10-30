#!/bin/bash

# =====================================================
# 💡 Bash Cron Jobs Demo Script
# =====================================================
# This file demonstrates:
# - Scripts that can be scheduled via cron
# - Logging output
# - Default variables
# - Error handling
# - Examples for different cron schedules
# =====================================================


# * * * * * command_to_run
# - - - - -
# | | | | |
# | | | | +---- Day of the week   (0-7) (Sunday=0 or 7)
# | | | +------ Month             (1-12)
# | | +-------- Day of the month  (1-31)
# | +---------- Hour              (0-23)
# +------------ Minute            (0-59)



# -----------------------------------------------------
# 1️⃣ Example: Daily backup script
# -----------------------------------------------------
daily_backup() {
    # Default backup directory
    BACKUP_DIR="${1:-$HOME/backups}"
    mkdir -p "$BACKUP_DIR"

    # Log file
    LOG_FILE="$BACKUP_DIR/backup.log"

    echo "[$(date)] Starting daily backup..." >> "$LOG_FILE"

    # Simulate backup command
    echo "Backing up files..." >> "$LOG_FILE"
    sleep 1  # simulate time delay
    echo "Backup completed successfully!" >> "$LOG_FILE"

    echo "[$(date)] Backup finished" >> "$LOG_FILE"
}

# -----------------------------------------------------
# 2️⃣ Example: Hourly log cleanup
# -----------------------------------------------------
hourly_cleanup() {
    LOG_DIR="${1:-$HOME/logs}"
    mkdir -p "$LOG_DIR"
    LOG_FILE="$LOG_DIR/cleanup.log"

    echo "[$(date)] Starting log cleanup..." >> "$LOG_FILE"

    # Remove logs older than 7 days
    find "$LOG_DIR" -type f -mtime +7 -name "*.log" -exec rm -f {} \;

    echo "[$(date)] Cleanup finished" >> "$LOG_FILE"
}

# -----------------------------------------------------
# 3️⃣ Example: Script run at system startup
# -----------------------------------------------------
startup_message() {
    MESSAGE_FILE="${1:-$HOME/startup_message.txt}"
    echo "[$(date)] System startup detected" >> "$MESSAGE_FILE"
}

# -----------------------------------------------------
# 4️⃣ Example: Script with arguments and defaults
# -----------------------------------------------------
greet_user() {
    NAME="${1:-Guest}"
    LOG_FILE="${2:-$HOME/greet.log}"
    echo "[$(date)] Hello, $NAME!" >> "$LOG_FILE"
}

# -----------------------------------------------------
# 5️⃣ Example: Error handling in cron scripts
# -----------------------------------------------------
safe_divide() {
    if [[ $2 -eq 0 ]]; then
        echo "[$(date)] ❌ Error: Division by zero!" >> "$HOME/error.log"
        return 1
    fi
    echo "[$(date)] Result: $(( $1 / $2 ))" >> "$HOME/error.log"
}

# -----------------------------------------------------
# 6️⃣ Demo Calls
# -----------------------------------------------------
# NOTE: These are example calls. In real cron, you schedule the script instead.

echo "===== Running Demo Cron Tasks ====="

# Daily backup demo
daily_backup "$HOME/demo_backup"

# Hourly cleanup demo
hourly_cleanup "$HOME/demo_logs"

# Startup message demo
startup_message "$HOME/demo_startup.txt"

# Greeting with argument
greet_user "Siam" "$HOME/demo_greet.log"

# Greeting with default
greet_user

# Safe divide demo
safe_divide 10 2
safe_divide 10 0

# -----------------------------------------------------
# 7️⃣ Example Crontab entries (paste into 'crontab -e')
# -----------------------------------------------------
: '
# Run daily backup at 3:30 AM
30 3 * * * /home/user/functions_cron_demo.sh

# Run hourly cleanup every hour
0 * * * * /home/user/functions_cron_demo.sh cleanup

# Run at system startup
@reboot /home/user/functions_cron_demo.sh startup

# Run greeting every day at 9 AM
0 9 * * * /home/user/functions_cron_demo.sh greet "Siam"

# Run safe divide every day at 10 AM
0 10 * * * /home/user/functions_cron_demo.sh divide 10 2
'

# =====================================================
# 🧠 Summary
# =====================================================
# ✅ Cron jobs allow automation of repetitive tasks
# ✅ Use scripts with logging for safety and debugging
# ✅ Use default variables to make scripts flexible
# ✅ Include error handling for safe execution
# ✅ Use crontab -e to schedule these scripts
# ✅ Use @reboot, @daily, @hourly for shortcuts
# ✅ Always use absolute paths in cron scripts
# =====================================================
