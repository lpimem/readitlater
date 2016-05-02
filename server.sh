#! /bin/bash

if [ $# -lt 1 ]; then
  echo "USAGE:"
  echo "    ./server.sh [CMD]"
  echo "    [CMD]:"
  echo "        start: start the server at 0.0.0.0:8000"
  echo "        stop: stop the server"
  echo "        restart: restart the server"
  echo "        reset: reset db and restart server"
  exit
fi

CMD="$1"
PID_FILE=tmp/pids/server.pid
if [ $CMD = "start" ]; then
  if [ -f $PID_FILE ]; then
    PID=$(<$PID_FILE)
    echo "Server running with pid: $PID"
    exit
  fi
  rails s -b 0.0.0.0 -d
elif [ $CMD = "stop" ]; then
  if [ -f $PID_FILE ]; then
    PID=$(<$PID_FILE)
    kill $PID
  else
    echo "Not running"
  fi
elif [ $CMD = "restart" ]; then
  ./server.sh stop && \
  ./server.sh start
elif [ $CMD = "reset" ]; then
  ./server.sh stop
  rake db:migrate:reset ; rake db:seed
  ./server.sh start
fi
