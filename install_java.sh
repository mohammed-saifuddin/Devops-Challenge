#!/bin/bash

LOG_DIR="/opt/logs"
LOG_FILE="$LOG_DIR/script_logs.log"

mkdir -p $LOG_DIR

{
  echo "$(date) - Downloading OpenJDK 1.8"
  sudo apt update
  sudo apt install openjdk-8-jdk -y

  echo "$(date) - Setting JAVA_HOME and updating PATH"
  echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" >> ~/.bashrc
  echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
  source ~/.bashrc

  echo "$(date) - Java version:"
  java -version

} &>> "$LOG_FILE"
