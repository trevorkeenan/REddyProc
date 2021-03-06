\name{gfGapFillLookupTable}
\alias{gfGapFillLookupTable}
\title{gfGapFillLookupTable}
\description{Gap filling with Look-Up Table (LUT)
Look-Up Table (LUT) algorithm of up to five conditions within prescribed window size}
\usage{gfGapFillLookupTable(toFill, winExt = 3L * 48L, covM, 
    fTolerance = function(target) return(tolerance), 
    fIsInTolerance = gfIsAllWithinAbsoluteTolerance, 
    tolerance, iRecsGap = which(!is.finite(toFill)), 
    isVerbose = TRUE, minNSimilar = 2L)}
\arguments{
  \item{toFill}{numeric vector to be filled (with NA also for gaps that have been already filled with a narrower window)}
  \item{winExt}{scalar integer: number of records to extend window in both directions, Window size in records is then 2*winExtDays+1L}
  \item{covM}{numeric data.frame or matrix with covariates in columns and no other columns}
  \item{fTolerance}{function that returns tolerance vector depending on target vector of covariates
It specifies for each entriy in target, on how much the covariates can deviate from it and still regarded as similar.
The order of entries must correspond to the columns in covM.}
  \item{fIsInTolerance}{function to decide wheter covariates of a record are close enough to the target.
Allows to use other criteria of combined covariatess than the default of all separately within tolerance.
The function must take the same parameters and return a vector for each column in covM as in \code{\link{gfIsAllWithinAbsoluteTolerance}}.}
  \item{tolerance}{numeric vector: alternative way to specify a constant tolerance, returned by the default fTolerance function}
  \item{iRecsGap}{integer vector of positions of gaps to fill.
Set to a subset if some of gaps were filled before.
Set to seq_along(toFill) to estimate uncertainty for all records.}
  \item{isVerbose}{logical scalar: set to FALSE to avoid print status information to screen}
  \item{minNSimilar}{integer scalar: number of records of similar conditions to fill gap}
}
\details{For target record numbers statistics are computed across values of the variable during 
neighboring times with similar conditons.
This can be used to fill gaps by the mean of similar values, or to estimate the uncertainty of the values.
Neighboring times are specified by a window (argument \code{winExt})
Similar conditions are specified by providing covariate variables and for each a tolerance on 
how much they may deviate from covariate values of the target record.}
\value{A matrix with with rows with statistics of values in similar conditions
index: rownumber of filled record, mean: mean across all similar records in period, fnum: number of similar records, fsd: standard deviation of the mean }

\author{TW
(Department for Biogeochemical Integration at MPI-BGC, Jena, Germany)}





