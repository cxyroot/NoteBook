start=$1
end=$2
port=$3
for slot in `seq ${start} ${end}`
do
  echo "slot:${slot}"
   /usr/local/bin/redis-cli -h 192.168.175.105 -p ${port} -a 123456 cluster addslots ${slot}
done
