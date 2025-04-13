#!/usr/bin/bash

# This is my Centos server health check script

# This is the variable where the report file is saved 
LOGFILE="/home/abel/Centos_health.log"

# This is the variable that checks the current time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

#This is a function that is created
health_log() {
    printf "%b" "$1" | tee -a "$LOGFILE"
    
}
health_log "\n=============================="
health_log " Centos Server Health Report Summary - $TIMESTAMP"
health_log "=============================="

# Shows how long my Centos server is up and running
health_log "\n[Centos Server Load]\n"
health_log "$(uptime)"

# Shows the available memory usage on my Centos server
health_log "\n[Centos Memory Usage]\n"
health_log "$(free -h)"

#Prints the disk usage for my server 
health_log "\n[Centos Disk Usage]\n"
health_log "$(df -h)"

# Prints the top 5 resources that are running on the server
health_log "\n[Centos Top 5 runnning resources ]\n"
health_log "$(ps -eo pid,cmd,%cpu,%mem --sort=-%cpu | head -n 6)"
