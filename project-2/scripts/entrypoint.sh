#!/bin/bash

python3 /opt/metrics_server.py &

ACTIONS=("cpu" "mem" "crash" "network" "disk" "sleep")

while true; do
        CHOICE=${ACTIONS[$RANDOM % ${#ACTIONS[@]}]}

        echo "============================"
        echo "Randomly selected action: $CHOICE"
        echo "$(date)"
        echo "============================"

        case "$CHOICE" in
         cpu)
          echo " Triggering CPU load..."
          blade create cpu load --cpu-percent 90 --timeout 60
          ;;
         mem)
          echo " Triggering Memory load..."
          blade create mem load --mem-percent 80 --timeout 60
          ;;
         crash)
          echo " Crashing the app..."
          exit 1
          ;;
         network)
          echo " Adding 3000ms network delay to eth0..."
          blade create network delay --interface eth0 --time 3000 --timeout 60
          ;;
         disk)
          echo " Filling disk with 512MB..."
          blade create disk fill --size 512 --timeout 60
          ;;
         sleep)
          echo " App is sleeping (simulated hang)..."
          sleep 600
          ;;
        esac

        SLEEP_TIME=$((600 + RANDOM % 300)) 
        echo "Waiting $SLEEP_TIME seconds (~$(($SLEEP_TIME / 60)) minutes) before next fault..."
        sleep $SLEEP_TIME
done
