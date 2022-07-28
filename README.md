# IDR_ATAC

This script takes 2 or more ATAC narrowPeak files & performs IDR analysis on them (in pairwise fashion) \
Finally it mergeds the idr files into one consensus peak file (defition: a peak that is present in at least two replicates) \

## How use the script: 
 - download the idr_ATAC.sh script to a directory containing your ATAC narrowPeak replicates \
 - how to run the script: . idr_ATAC.sh
 - Input file name should be compliant to this format (example below of three replicates)
 - 1_Late_blastulation_R1.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R2.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R3.mLb.clN_peaks.narrowPeak
 
 
 ## Output:
 - Results will be in a new directory <IDR_YYYY_MM_DD>, inside this you will find one directory for each sample
 - Look for *consensus_peaks.bed file in sub-directories for the final result
