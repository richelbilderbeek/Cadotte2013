#! /bin/bash

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

echo "Sequences:"
echo ${sequences[@]}
echo "Number of sequences:"
echo ${#sequences[@]} #Number of elements in the array

perl ncbi_search.pl -q ${sequences[1]} -o ${sequences[1]}.fasta -d nucleotide -r fasta -m 2000



