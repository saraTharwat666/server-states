#!/bin/bash
echo "======================================"
echo "       SERVER PERFORMANCE STATS        "
echo "======================================"
echo ""

# Total CPU usage
echo "📌 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " (100 - $8) "%"}'

# Total memory usage (Free vs Used including percentage)
echo "📌 Memory Usage:"
free -h | awk '/Mem: / {total = $2 ; used = $3 ; free = $4 ; percent = ($3/$2)*100 ; printf "Memory Usage: Total: %s | Used: %s | Free: %s | Usage: %.2f%%\n", total, used, free, percent}'

# Total disk usage (Free vs Used including percentage)
echo "📌 Disk Usage:"
df -h / | awk '/\// {printf "Disk Usage: Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5}'

# Top 5 processes by CPU usage
echo "📌 Top 5 Processes by CPU Usage:"
ps -eo  pid,comm,%cpu --sort=-%cpu | head -n 6 

# Top 5 processes by memory usage
echo "📌 Top 5 Processes by Memory Usage:"
ps -eo  pid,comm,%mem --sort=-%mem | head -n 6 

