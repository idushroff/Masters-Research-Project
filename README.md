# Exploring Machine Learning-Derived Proxy Labels for Alzheimer’s Disease GWAS

## Overview

This repository contains the code and materials for my Master’s research project at the University of Melbourne, where I explored the use of machine learning to generate proxy labels for Alzheimer’s Disease (AD) Genome-Wide Association Studies (GWAS).

Traditional GWAS rely on accurate disease labels. However, for age-related diseases like AD, many individuals labeled as "controls" may actually go on to develop the disease later in life—reducing statistical power. One common workaround has been "GWAS by proxy" (GWAX), which relabels controls as cases if they have a family history of AD. But how effective is family history as a proxy label?

This project evaluates family history and other features (e.g., cognitive scores, APOE genotype) using machine learning models to predict conversion to AD across time, and tests how well these predictions align with known genetic associations.

## Research Questions

- Is family history a valid proxy label for AD?
- Can machine learning models trained on longitudinal data better estimate lifetime AD risk?
- Do these models improve GWAS power when used to relabel participants?
- How do these machine-derived proxy labels compare to family history when applied to real-world genetic data?

## Methods Summary

We developed and evaluated a series of **binary** and **survival** models to predict conversion to Alzheimer's Disease, using three longitudinal datasets:
- **ADNI** (Alzheimer’s Disease Neuroimaging Initiative) – Internal training dataset
- **AIBL** (Australian Imaging, Biomarker & Lifestyle) – External validation
- **UK Biobank** – External validation and genetic analysis

### Models

- Binary Classification:
  - Logistic Regression
  - Random Forest
  - XGBoost

- Survival Analysis:
  - Cox Proportional Hazards
  - Regularized Cox
  - Random Survival Forest

We conducted:
- 5-fold cross-validation on ADNI for model selection.
- External validation on AIBL and UKBB.
- Genetic association analysis using 58 SNPs identified in a prior meta-analysis to compare predicted proxy labels against traditional case-control labels.

## Key Findings

- Family history alone performs poorly at predicting AD conversion.
- Adding cognitive and genetic features improves model performance.
- Survival models (especially Random Survival Forest) better capture long-term AD risk.
- However, ML-derived proxy labels show **lower correlation** with known SNPs compared to family history—suggesting they may not be suitable direct substitutes in GWAS.
- Removing APOE dramatically reduces proxy label performance across all approaches, highlighting its dominant effect in AD risk.

## Limitations

- Family history data is self-reported and error-prone.
- APOE status may bias all models and proxy labels.
- Models trained on ADNI may not generalize well due to demographic and phenotypic differences.
- Imaging variables were not included in this study.

## Future Work

- Explore semi-supervised or deep learning methods optimized for genetic correlation.
- Investigate family history as a proxy label independent of APOE.
- Include multi-omics or imaging features in risk modeling.
- Expand analyses to more diverse cohorts and prospective datasets.

## Repository Structure

```bash

├── R_scripts/
│   ├── 1_Data_Analysis_of_ADNI_Dataset.Rmd
│   ├── 2_Descriptive_Analysis_of_ADNI+AIBL+UKBB_Datasets.Rmd
│   ├── 3_Predictive_Analysis_Binary_Classification_Models.Rmd
│   ├── 4_Predictive_Analysis_Survival_Models.Rmd
│   ├── 5_UKBB_Regression_Analysis_Binary_Models.Rmd
│   └── 6_UKBB_Regression_Analysis_Survival_Models.Rmd
└── README.md










