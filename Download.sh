#! /bin/bash

# Downloads all gene sequences used in the article

declare -a sequences=(
  'GU381745'
  'HQ590061'
  'GU381750'
  'HQ593266'
  'EU677028'
  'EU749420'
  'AY943493'
  'DQ667319'
  'GU381423'
  'JN407461'
  'FJ409474'
  'EU125357'
  'HQ142603'
  'AF477625'
  'AB530973'
  'AY816235'
  'EF590504'
  'AY804146'
  'AY943493'
  'DQ667319'
  'GU381423'
  'JN407461'
  'FJ409474'
  'EU125357'
  'HQ142603'
  'AF477625'
  'U72811'
  'AY804146'
  'AY943493'
  'DQ667319'
  'GU381423'
  'JN407461'
  'FJ409474'
  'EU125357'
  'HQ142603'
  'AF477625'
  'U72811'
  'AY804146'
  'GQ248084'
  'AJ784818'
  'HE577863'
  'AF144577'
  'HE586094'
  'Z49839'
  'DQ78691'
  'DQ471685'
  'DQ005015'
  'DQ005071'
  'EF396960'
  'FJ040168'
  'DQ531111'
  'DQ005015'
  'DQ005071'
  'EF396960'
  'FJ040168'
  'DQ471685'
  'DQ005015'
  'DQ005071'
  'EF396960'
  'FJ040168'
);

# echo "Sequences:"
# echo ${sequences[@]}
# echo "Number of sequences:"
# echo ${#sequences[@]} #Number of elements in the array

# Downloading sequences
for (( i=0; i!=${#sequences[@]}; ++i ))
do
  if [ ! -e ${sequences[i]}.fasta ]
  then
    echo Downloading: ${sequences[i]}
    perl ncbi_search.pl -q ${sequences[i]} -o ${sequences[i]}.fasta -d nucleotide -r fasta -m 2000
  fi
done

# Merging sequences
if [ ! -e Sequences.fasta ]
then
  for myfile in `ls *.fasta`
  do
    cat $myfile >> Sequences.fasta
  done
fi

# Download MUSCLE
if [ ! -e muscle3.8.31_i86linux32.tar.gz ]
then
  echo Downloading MUSCLE
  wget http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux32.tar.gz
fi

# Unpacking MUSCLE
if [ ! -d MUSCLE ]
then
  echo Creating MUSCLE folder
  mkdir MUSCLE
fi

if [ ! -e MUSCLE/muscle3.8.31_i86linux32 ]
then
  echo Unpacking MUSCLE
  tar zxvf muscle3.8.31_i86linux32.tar.gz -C MUSCLE
  cd MUSCLE
  chmod +x muscle3.8.31_i86linux32
fi