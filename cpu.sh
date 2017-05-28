ps axo pcpu | 
 gawk -v cores=`grep -m 1 cores /proc/cpuinfo | cut -d ' ' -f 3` \
      -v cpus=`grep -c processor /proc/cpuinfo` \
         '{k+=$1}END{print k/(cores * cpus);}'
