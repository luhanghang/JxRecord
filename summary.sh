#!/bin/bash
echo select seq from JxRecords.spots order by seq|/usr/local/mysql/bin/mysql -u root -p1 > /tmp/spots
i=0
while read LINE 
do
	if [ $i == 1 ]; then
		find $1 -name *$LINE* -size +100k -exec ls -l {} \; |awk -v s="$LINE" 'BEGIN{size=0;} \
 			{ size = size + $5/1024/1024;} \
   			END{print s " --> " size/1024 " GB" }'
	fi
	i=1
done < "/tmp/spots"
