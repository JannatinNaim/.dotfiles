function killnode {
  NODE_PROCS=`ps -ax | grep node`
  if [ $# -ne 0 ]; then
    echo "Obliterating $1 whole family. - Technoblade."
    NODE_PROCS=`echo $NODE_PROCS | grep $1`
  fi
  echo "It's a festival. - Technoblade."
  kill -15 `echo $NODE_PROCS | awk '{print $1}'` 2> /dev/null
}
