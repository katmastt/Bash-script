#!/bin/bash

diseasesF=$1
countriesF=$2
inputD=$3
numFD=$4
numRP=$5

#echo "First arg: $diseasesF"
#echo "Second arg: $countriesF"
#echo "Third arg: $inputD"
#echo "Fourth arg: $numFD"
#echo "Fifth arg: $numRP"

if [ "$#" -ne 5 ]; then
    echo "Too few arguments"
    exit 1
fi

check1=`echo "$4" | grep -E ^[0-9]+$`
check2=`echo "$5" | grep -E ^[0-9]+$`
if [ "$check1" == '' ]; then
  #not number
  echo "the fourth argument is not a number"
  numFD=4
fi

if [ "$check2" == '' ]; then
  #not number
  echo "the fifth argument is not a number"
  numRP=3
fi

mkdir $inputD
id=0
n=1
while read line; do
  mkdir $inputD/$line
  for ((k=1; k<=$numFD; k++))
  do
    #https://tldp.org/LDP/abs/html/randomvar.html
    RANGE=30
    FLOOR=1
    day=0   #initialize
    while [ "$day" -le $FLOOR ]
    do
      day=$RANDOM
      let "day %= $RANGE"  # Scales $number down within $RANGE.
    done

    RANGE=12
    FLOOR=1
    month=0   #initialize
    while [ "$month" -le $FLOOR ]
    do
      month=$RANDOM
      let "month %= $RANGE"  # Scales $number down within $RANGE.
    done
    RANGE=2020
    FLOOR=1970
    year=0   #initialize
    while [ "$year" -le $FLOOR ]
    do
      year=$RANDOM
      let "year %= $RANGE"  # Scales $number down within $RANGE.
    done
    filename="${day}-${month}-${year}"
    touch $inputD/$line/$filename
    for ((file=1; file<=$numRP; file++))
    do
      id=$((id+1))
      BINARY=2
      T=1
      number=$RANDOM
      let "number %= $BINARY"
      if [ "$number" -eq $T ]
      then
        entry="ENTER"
      else
        entry="EXIT"
      fi

     RANGE=7
     FLOOR=1
     index=0   #initialize
     while [ "$index" -le $FLOOR ]
     do
       index=$RANDOM
       let "index %= $RANGE"  # Scales $number down within $RANGE.
     done
     name=$(head -$index names | tail -1)

     RANGE=5
     FLOOR=1
     index=0   #initialize
     while [ "$index" -le $FLOOR ]
     do
       index=$RANDOM
       let "index %= $RANGE"  # Scales $number down within $RANGE.
     done
     surname=$(head -$index surnames | tail -1)
#      name=$(cat /dev/urandom | tr -dc 'A-Za-z' | fold -w 12 | head -n 1)
#      surname=$(cat /dev/urandom | tr -dc 'A-Za-z' | fold -w 12 | head -n 1)

      RANGE=4
      FLOOR=1
      index=0
      while [ "$index" -le $FLOOR ]
      do
        index=$RANDOM
        let "index %= $RANGE"  # Scales $number down within $RANGE.
      done
      disease=$(head -$index $diseasesF | tail -1)

      RANGE=120
      FLOOR=1
      age=0
      while [ "$age" -le $FLOOR ]
      do
        age=$RANDOM
        let "age %= $RANGE"  # Scales $number down within $RANGE.
      done
      record="${id} ${entry} ${name} ${surname} ${disease} ${age}"
      echo $record >> $inputD/$line/$filename

    done
  done
  n=$((n+1))
done < $countriesF






