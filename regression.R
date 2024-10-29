computeSumStats <- function(yp_dat, geno_covar, is_binary=F) {
  # Identify columns starting with 'rs'
  rss = colnames(geno_covar)[grepl('^rs', colnames(geno_covar))]
  
  # Compute linear model summary statistics for each SNP
  sumstats = pbsapply(rss, \(rs) {
    # Subset data to include the current SNP, covariates, and remove geno_batch
    data_subset <- geno_covar %>%
      select(all_of(rs), -geno_batch, -one_of(setdiff(rss, rs)))
    
    # Combine yp and data_subset, remove rows with any NAs
    data_for_model <- data.frame(yp = yp_dat, data_subset) %>%
      na.omit()
    
    # Fit the linear model with yp as the dependent variable
    if(is_binary)
      m <- glm(yp ~ ., data = data_for_model, family='binomial')
    else
      m <- lm(yp ~ ., data = data_for_model)
    
    # Extract coefficients and filter for the SNP row
    summary(m) %>%
      coef() %>%
      as.data.frame() %>%
      filter(grepl("^rs", rownames(.)))
    
  }, simplify = F, USE.NAMES = T) %>%
    bind_rows() %>%
    magrittr::set_colnames(c('Est', 'SE', 't', 'P')) %>%
    rownames_to_column('rs')
}