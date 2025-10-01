#!/usr/bin/env bash
# tiny script that shows system info on display in an infinite loop. 
set -euo pipefail

# if applications installed?
if ! command -v htop &>/dev/null || ! command -v iotop &>/dev/null || ! command -v expect &>/dev/null || ! command -v duf &>/dev/null || ! command -v ifstat &>/dev/null; then
  echo "htop, iotop, duf or expect don't installed. Install them with 'sudo apt install htop iotop expect duf ifstat'."
  exit 1
fi

# Catch Ctrl+C
trap 'echo "Turn off..."; exit 0' INT

while true; do
  clear
  echo "=== CPU usage ==="
    expect << 'EOF'
    spawn sudo htop
    sleep 1
    send "q"
    expect eof
EOF
  sleep 5

  clear
  echo "=== CPU usage ==="
    expect << 'EOF'
    spawn sudo htop
    sleep 1
    send "q"
    expect eof
EOF
  sleep 5

  clear
  echo "=== Drive IO  ==="
    sudo pidstat -d 1 1
  sleep 5

  clear
  echo "=== Disk usage ==="
  sudo duf
  sleep 5

  clear
  echo "=== Memory usage ==="
  free -h | awk '
BEGIN {
    printf "\033[38;5;117m%-10s %-10s %-10s %-10s %-10s %-10s\033[0m\n", "Type", "Total", "Used", "Free", "Shared", "Buff/Cache"
    print "--------------------------------------------------"
}
NR>1 {
    if ($1 == "Mem:") {
        printf "\033[1;32m%-10s %-10s %-10s %-10s %-10s %-10s\033[0m\n", $1, $2, $3, $4, $5, $6
    } else if ($1 == "Swap:") {
        printf "\033[1;35m%-10s %-10s %-10s %-10s %-10s %-10s\033[0m\n", $1, $2, $3, $4, $5, $6
    }
}'
  sleep 5

  clear
  # выводим 5 строк (5 секунд мониторинга), потом возвращаемся в цикл
  ifstat -i enp2s0 1 5
  sleep 5

done
