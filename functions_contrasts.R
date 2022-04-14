# Functions for calculations of confidence intervals (CIs) about means and 
# contrasts. All CIs derived from the t-distribution, and thus relies on the 
# standard t-test assumptions of normality and equal variances.
#
# Stefan Wiens & Mats Nilsson, 2016-06-11. Revised: 2016-06-22.
# Contact: mats.nilsson@psychology.su.se



# ------------------------------------------------------------------------------
get_bcontrast <- function(data, group, coef, percent = 95, standardset = TRUE, 
                         error = c('anova', 'anova2')) {
  # Calculates a confidence interval about a contrast score (two-tailed) for
  # between-subject data
  #
  # Keyword arguments:
  # data -- vector with data for all groups (numeric)
  # group -- group labels, has to be a factor (factor)
  # coef -- vector with contrast weights, one per group. Make sure the weights 
  #         are given in the same order as levels(group). Also make sure that 
  #         the weights sum to zero, otherwise an error is thrown (numeric)         
  # percent -- Confidence-interval coverage in %, default is 95
  # standardset -- If true, converts to standard set (sum of abs weights = 2)
  # error -- Decides how to calculate the error term:
  #          'anova' pooles it over all groups, including those with a zero 
  #          coefficient; 'anova2' pools variances over all groups with non-zero
  #          coefficents
  #
  # Returns:
  # out -- vector with contrast-score, ci low-limit, ci hi-limit
  
  error <- match.arg(error)
  
  # Check input
  if (!is.factor(group)) stop ('class(group) has to be "factor"')
  if (abs(sum(coef)) > 1e-12) stop ('Not all contrasts sum to zero!')
  if (var(coef) < 1e-12) stop ('At least one contrast has all zeros!')
  
  # Name coefficients if not already named by group
  if (is.null(names(coef))) names(coef) <- levels(group)
  
  # Check that names(coef) is identical to levels(group), to avoid problems with
  # unordered factors and R sorting differently than you intended
  if (!identical(names(coef), levels(group))) {
    stop ('Check that weights are given in the same order as levels(group)')
  }
  
  # Convert coef to standard set
  if (standardset) { 
    z <- 2 / sum(abs(coef))
    coef <- z * coef
  } 
  
  # Calculate contrast score
  contrast_score <- sum(tapply(data, group, mean) * coef)
  
  # Calculate error term for contrast score.
  if (error == 'anova') {
    # Use pooled variance from all groups (i.e., based on mserror from ANOVA)
    group_ss <- tapply(data, group, function(x) sum((x-mean(x))^2))
    group_n <- tapply(data, group, length)
    mserror <- sum(group_ss) / sum(group_n - 1)  # ss within
    coef2 <- coef^2
    coef2n <- coef2 / group_n    
    contrast_se <- sqrt(mserror * sum(coef2n))  # stand.error of contrast
    df <- sum(group_n - 1)
    
  } else if (error == 'anova2') {
    # Pooled variance from all groups with non-zero coefficients
    nzcoef <- abs(sign(coef))  # indicator variable: nonzero coefficients = 1
    group_n <- tapply(data, group, length) * nzcoef 
    group_ss <- tapply(data, group, function(x) sum((x-mean(x))^2)) * nzcoef 
    mserror <- sum(group_ss) / sum((group_n - 1) *nzcoef)  # ss within
    # stand.error of contrast
    # contrast_se <- sqrt(2 * mserror / (sum(group_n) / sum(nzcoef)))
    coef2 <- coef^2
    coef2n <- coef2[nzcoef == 1] / group_n[nzcoef == 1]  
    contrast_se <- sqrt(mserror * sum(coef2n))
    df <- sum(group_n - 1 * nzcoef)
  }
  
  # calculate confidence interval
  alpha <- 1 - (percent/100)
  p <- 1 - alpha / 2 #  two-tailed CI
  tcrit <- qt(p, df)
  plusminus <- c(-1, 1)
  ci <- contrast_score + plusminus * tcrit * contrast_se
  tobs <- contrast_score / contrast_se
  pobs <- 2 * pt(-abs(tobs), df)
  
  # Assemble output
  out <- c(contrast_score, ci, tobs, df, pobs, contrast_se, mserror, 
           round(coef, 3))
  names(out) <- c('Score', 'CI_LL', 'CI_UL', 'Tobs', 'df', 'p', 'SE', 'MSerror', 
                  levels(group))
  out
}
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
get_wcontrast <- function(data, group, id, coef, percent = 95, 
                          standardset = TRUE) {
  # Same as get_contrast(), but for within-subject data. 
  # An id-variable has to be specified, with the help of which indiviual 
  # contrast scores are calculated. These are then treated as difference scores
  # with n-1 degress of freedom and CIs are the same as would be obtained using
  # a one-sample t-test.
  
  # Check input
  if (!is.factor(group)) stop ('class(group) has to be "factor"')
  if (abs(sum(coef)) > 1e-12) stop ('Not all contrasts sum to zero!')
  if (var(coef) < 1e-12) stop ('At least one contrast has all zeros!')
  
  # Name coefficients if not already named by group
  if (is.null(names(coef))) names(coef) <- levels(group)
  
  # Check that names(coef) is identical to levels(group), to avoid problems with
  # unordered factors and R sorting differently than you intended
  if (!identical(names(coef), levels(group))) {
    stop ('Check that weights are given in the same order as levels(group)')
  }
  
  # Convert coef to standard set
  if (standardset) {
    z <- 2 / sum(abs(coef))
    coef <- z * coef
  }
  
  # Calculate contrast score on individual means
  indmean = tapply(data, list(group, id), mean) 
  indscore <- apply(indmean * coef, 2, sum)
  contrast_score <- mean(indscore)
  contrast_se <- sqrt(var(indscore) / length(indscore))
  dfr <- length(indscore) - 1
  
  # calculate confidence interval
  alpha <- 1 - (percent/100)
  p <- 1 - alpha / 2 #  two-tailed CI
  tcrit <- qt(p, dfr)
  plusminus <- c(-1, 1)
  ci <- contrast_score + plusminus * tcrit * contrast_se
  tobs <- contrast_score / contrast_se
  pobs <- 2 * pt(-abs(tobs), dfr)
  
  # Assemble output
  out <- c(contrast_score, ci, tobs, dfr, pobs, contrast_se, 
           round(coef, 3))
  names(out) <- c('Score', 'CI_LL', 'CI_UL', 'Tobs', 'df', 
                  'p', 'SEM', levels(group))
  out
  
}
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
plot_contrast <- function(x) {
  # Plot confidence interval(s) around one or more contrasts
  #
  # Keyword arguments:
  # x -- numeric vector or matrix with 3 values or columns: contrast-score,
  #                                                         cilo, cihi
  # Returns: Nothing, just draws the plot
  
  if (!is.matrix(x)) x <- matrix(x, nrow = 1)
  if (is.null(rownames(x))) rownames(x) <- 1:nrow(x)
  
  toplot <- x[, 1:3, drop = FALSE]  # Drop = FALSE to keep it as a matrix
  
  # Set limist of x-axis
  xlim <- c(0.5, nrow(toplot) + 0.5)
  xticks <- seq(1:nrow(toplot))  # Set x-axis values where to draw contrasts
  
  # Set limits on y-axis and define spacing and location of y-axis values
  ymin <- min(toplot)
  ymax <- max(toplot)
  distance <- max(ymax, abs(ymin))
  spacing <- signif((distance / 6), 1)  # Spacing y-axis values
  steps_above <- ceiling(ymax / spacing)
  if (ymin > 0) {
    steps_below <- 0 
  } else {
    steps_below <- -ceiling(abs(ymin) / spacing)
  }
  yspacing <- seq(steps_below * spacing, steps_above * spacing, by = spacing)
  room <- 0.2  # Distannce largest abs(values) to axis, in percent
  ylim <- c(min(yspacing) - room * spacing, max(yspacing) + room * spacing)
  
  # Draw plot and add CIs, using arrows(), and scores, using points()
  plot(1, 1, type = 'n', xlim = xlim, ylim = ylim, 
       axes = FALSE, xlab = '', ylab = '')
  arrows(xticks, toplot[, 2] , xticks, toplot[, 3], length = 0.05, 
         angle = 90, code = 3, lwd = 0.7)
  points(xticks, toplot[, 1], pch = 21, bg = 'grey')
  
  # Add x-axes with contrast labels on axis(1)
  axis(1, at = c(xlim[1], xticks, xlim[2]), labels = c('', rownames(x), ''),
       tck = 0.01, cex.axis = 0.8, pos = ylim[1],
       mgp = c(3, 0.5, 0))
  axis(3, at = c(xlim[1], xticks, xlim[2]), labels = rep('', 2 + nrow(toplot)), 
       tck = 0.01, pos =  ylim[2])
  mtext('Contrast', side = 1, line = 1.5, cex.lab = 1,las = 0)
  
  # Add y-axes
  axis(2, at = c(ylim[1], yspacing, ylim[2]),labels = c('', yspacing, ''),
       tck = 0.01, cex.axis = 0.8, pos = xlim[1], las = 2, 
       mgp = c(3, 0.5, 0))
  axis(4, at = c(ylim[1], yspacing, ylim[2]),  
       labels = rep('', length(yspacing) + 2), 
       tck = 0.01, pos = xlim[2], las = 2)
  mtext('Contrast score', side = 2, line = 1.5, cex.lab = 1, las = 0)
  
  # Line at contrast score = 0
  lines(xlim, c(0,0), lty = 2) 
}
# ------------------------------------------------------------------------------


get_example_data <- function(design = c('between', 'mixed', 'within'), 
                             way = c('two', 'one'), seed = 1) {
  # Get example data and define id-variable according to specified design. Data 
  # is inspired by an example from Howell (Table, 13.2), who modelled it on a 
  # study by Eysenck (1974). 
  # Design originally a 5 (encode condition) x 2 (age group) between-subject 
  # design. Outcome: recall of words in relation to the five levels of encoding,  
  # defined according to instructions to participants, and ordered from shallow 
  # to deep  (C = count letters, R = ryhm, A = think of appropriate  adjective, 
  # I = imagine visually, M = memorize for later recall).
  # The factor age-group is skipped if a one-way design is selected. If a two-way 
  # within design is selected, pretend that age-group refer to old-fashioned vs. 
  # modern words to be recalled.
  # 
  # Reference: Howell, D. C. (2013) Statistical Methods for Psychology 
  # (8th International Ed.), Wadsworth, UK.
  #
  # Keyword arguments:
  # design -- 'between', 'mixed', or 'within'. Default is 'two', Note that 
  #                                           'mixed' requires two-way
  # way -- 'one' or 'two'. Defaule is 'two'.
  # seed -- set the seed of the random number generator, if set to NULL,  
  #         different samples will be generated each time
  #
  # Returns:
  # d -- data frame, with data in long format (use reshape() if you prefer wide)
  
  design <- match.arg(design)
  way <- match.arg(way)
  
  # Simulate dependent variable: Recall of words in 5 conditions x 2 groups, 
  # means (m) taken from Howell, Table 13.2. Data sampled from N(m, 2.5), thus
  # normality and equal variance conditions are fulfilled. 
  recall_means <- c(7.0, 6.9, 11.0, 13.4, 12.0, 6.5, 7.6, 14.8, 17.6, 19.3)
  if (!is.null(seed)) set.seed(seed)  # set seed if specified by user
  rdata <- rnorm(n = 10 * 10, mean = 0, sd = 2.5)
  rmatrix <- matrix(rdata, nrow = 10, ncol = 10, byrow = 10)
  rcenter <- apply( rmatrix, 1, function(x) (x - mean(x)))
  recall <- t(rcenter) + recall_means
  
  # Sort per condition, to make within analysis more relevant
  recall <- apply(recall, 1, sort)  
  # Round, since outcome is number of words recalled
  recall <- round(as.vector(recall))  
  
  # Encode conditions
  encode_conditions <- c(rep(sort(rep(1:5, 10)), 2))
  encode_names <- c('C', 'R', 'A', 'I', 'M')
  encode <- factor(encode_conditions, levels = c(1:5), encode_names)
  
  # Age group
  agegroup  <- c(rep(1, 50), rep(2, 50))
  agenames <- c('Old', 'Yng')
  age <- factor(agegroup, levels = c(1:2), agenames)
  
  # id number for between subject designs
  idb <- seq(length(recall)) + 100
  
  # id number for mixed design (between = age, within = encode)
  tempid <- rep(1:10, 10)
  tempid <- tempid + 100 * (age == 'Old')
  idm <- tempid + 200 * (age == 'Yng')
  
  # id number for within subject design, one-way (within = encode; n = 20) or  
  # two-way within (age x encode; n = 10. Pretend 'age' is a property of
  # the words to be remembered.)
  idw1 <- c(rep(seq(101, 110), 5), rep(seq(111, 120), 5))
  idw2 <- rep(seq(101, 110), 10)
  
  type <- paste(way, design)
  id <- switch(type, 'one between' = idb, 'two between' = idb, 'two mixed' = idm, 
               'one within' = idw1, 'two within' = idw2)
  
  if (way == 'one') {
    d <- data.frame(id, encode, recall)  # Skip age-group in one-way designs
  } else if (way == 'two') {
    d = data.frame(id, encode, age, recall)  # Here age-group is included
  } else { stop ("Something's wrong, you shouldn't be here!")} 
  
  d  # Return data frame
}
