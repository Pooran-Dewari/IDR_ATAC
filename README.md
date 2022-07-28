# IDR_ATAC

This script takes >2 ATAC narrowPeak files and performs IDR analysis on them (in pairwise fashion) \
Finally it mergeds the idr files into one consensus peak file (defition: a peak that is present in at least two replicates) \

## How use the script: 
 - download the idr_ATAC.sh script to a directory having your ATAC narrowPeak replicates for a sample (if have replicates for more than one sample, \
 then run separately for each sample)
 - run the script: . idr_ATAC.sh
 - Input file name should be compliant to this format
 - 1_Late_blastulation_R1.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R2.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R3.mLb.clN_peaks.narrowPeak
 
 
 ## Output:
 - Results will be in a new directory <IDR_YYYY_MM_DD>
 - Look for *consensus_peaks.bed file in sub-directories for the final result
