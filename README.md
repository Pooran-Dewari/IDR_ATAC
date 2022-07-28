# IDR_ATAC: IDR analysis on ATAC narrowPeak files & calling consensus peaks

This script takes two or more ATAC narrowPeak files & performs IDR analysis on them (in pairwise fashion) \
Finally it merges the idr files into one consensus peak file (defition: a peak that is present in at least two replicates)

## Requirement:
### Install IDR
- wget -c https://github.com/nboley/idr/archive/refs/tags/2.0.3.zip
- unzip 2.0.2.zip
- cd 2.0.2/
- idr -h #check installation

### Install bedtools using conda (I have it in environment 'intervene')
- conda install -c bioconda bedtools #change line 70 of idr_ATAC.sh to your conda environment
### Install bedops
- https://bedops.readthedocs.io/en/latest/content/installation.html

## How: 
 - download the idr_ATAC.sh script to a directory containing your ATAC narrowPeak replicates
 - how to run the script: . idr_ATAC.sh
 - Input file name should be compliant to this format (example below of three replicates per sample)
 - 1_Late_blastulation_R1.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R2.mLb.clN_peaks.narrowPeak
 - 1_Late_blastulation_R3.mLb.clN_peaks.narrowPeak
 - 2_Mid_gastrulation_R1.mLb.clN_peaks.narrowPeak
 - 2_Mid_gastrulation_R2.mLb.clN_peaks.narrowPeak 
 - 2_Mid_gastrulation_R3.mLb.clN_peaks.narrowPeak
 - 3_Early_somitogen_R1.mLb.clN_peaks.narrowPeak
 - 3_Early_somitogen_R2.mLb.clN_peaks.narrowPeak
 - 3_Early_somitogen_R3.mLb.clN_peaks.narrowPeak
 - 4_Mid_somitogen_R1.mLb.clN_peaks.narrowPeak
 - 4_Mid_somitogen_R2.mLb.clN_peaks.narrowPeak
 - 4_Mid_somitogen_R3.mLb.clN_peaks.narrowPeak
 - 5_Late_somitogen_R1.mLb.clN_peaks.narrowPeak
 - 5_Late_somitogen_R2.mLb.clN_peaks.narrowPeak
 - 5_Late_somitogen_R3.mLb.clN_peaks.narrowPeak
 - 6_Late_eyed_R1.mLb.clN_peaks.narrowPeak
 - 6_Late_eyed_R2.mLb.clN_peaks.narrowPeak
 - 6_Late_eyed_R3.mLb.clN_peaks.narrowPeak
 
 
 ## Output:
 - Results will be in a new directory <IDR_YYYY_MM_DD>, inside this you will find one directory for each sample
 - Look for *consensus_peaks.bed file in sub-directories for the final result
