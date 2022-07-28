#sort narrowPeak
#this one is written based on filename for Salmon ATAC peaks
#script might not work if filenames are not in compliance to the following format
 #1_Late_blastulation_R1.mLb.clN_peaks.narrowPeak
 #1_Late_blastulation_R2.mLb.clN_peaks.narrowPeak
 #1_Late_blastulation_R3.mLb.clN_peaks.narrowPeak


ls *narrowPeak | while read filename;
do
sort -k8,8nr $filename > $filename"_sorted";
done


######## get filenames prefixes ###########
for fname in *sorted
do
  tmp=$(echo "$fname" | awk -F '_' '{print $1"_"$2"_"$3}' )
  newfname=${tmp}
  echo $newfname >> sorted_tmp.txt
done;

sort -u sorted_tmp.txt > sorted_list.txt

rm sorted_tmp.txt

#run IDR  using a loop

#first create a directory to put in all results for today
DIR_TEMP=$(date +%Y_%m_%d)
DIR_FINAL="IDR_${DIR_TEMP}"
mkdir $DIR_FINAL

#now run IDR
while read SORTED;
do
   mkdir $SORTED
   SORT_FILES=$(ls * | grep "$SORTED.*sorted")
   mv $SORT_FILES $SORTED/
   cd $SORTED
   NARROW=$(ls | grep $SORTED.*sorted)
   for i in $NARROW
    do
      for j in $NARROW
      do
        if [ "$i" \< "$j" ]
        then
         STAGE=$(echo $i| cut -d'_' -f 1)
         MARK=$(echo $i| cut -d'_' -f 2-3)
         REP1=$(echo $i| cut -d'_' -f 4 | cut -d'.' -f 1)
         REP2=$(echo $j| cut -d'_' -f 4 | cut -d'.' -f 1)
         #echo "Now doing IDR for $i & $j"
         echo "Now doing IDR:"
         echo "       - $i"
         echo "       - $j"
         echo "--------------------------------"
         echo $REP1 $REP2
	idr --samples $i $j \
	    --input-file-type narrowPeak \
	    --rank p.value \
	    --output-file $STAGE-$MARK-$REP1-$REP2-idr \
	    --plot \
	    --log-output-file $STAGE-$MARK-$REP1-$REP2.log
        fi
      done
    done
    #adding bits about IDR........
    mkdir $SORTED"_Consensus"
    for IDR in *idr;
    do
       conda activate intervene
       sortBed -i $IDR | grep -v 'CAJ' > $SORTED"_Consensus/"$IDR"_sorted";
       conda deactivate
    done
    #merge and get consensus
    cd $SORTED"_Consensus/"
    bedops --merge *"idr_sorted" > $SORTED"_consensus_peaks.bed"
    #conda deactivate

    #until here...................
    cd ../..
    mv $SORTED $DIR_FINAL
done < sorted_list.txt
rm sorted_list.txt


echo " *************"
echo "  ***********"
echo "   ********"
echo "    ******"
echo "     ****"
echo "   IDR done!!"
