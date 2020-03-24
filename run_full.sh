#!/bin/bash
ml gcc/5.5.0
ml R
set -e
bash download_data.sh
#Approach 1
Rscript tpm_age_sex.R 
#Approach 2
#Good to here
bash extract_protein_coding_lincRNA_genes.sh
Rscript generate_tissue_wise_TPM.R
Rscript tpm_age_sex_sva.R 37 #Lung
Rscript tpm_age_sex_sva.R 27 #Colon-transverse
Rscript tpm_age_sex_sva.R 38 #Minor salivary gland
Rscript Plot_SV_corrected.R
