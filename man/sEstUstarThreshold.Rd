\name{sEstUstarThreshold}
\alias{sEstUstarThreshold}
\title{sEstUstarThreshold}
\description{Estimate the Ustar threshold by aggregating the estimates for seasonal and temperature subsets. }
\usage{sEstUstarThreshold(ds = sDATA, UstarColName = "Ustar", NEEColName = "NEE", 
    TempColName = "Tair", RgColName = "Rg", seasonFactor.v = createSeasonFactorMonth(ds$sDateTime), 
    ctrlUstarEst.l = controlUstarEst(), ctrlUstarSub.l = controlUstarSubsetting(), 
    fEstimateUStarBinned = estUstarThresholdSingleFw2Binned, 
    isCleaned = FALSE)}
\arguments{
  \item{ds}{data.frame with columns named by the following arguments}
  \item{UstarColName}{collumn name for UStar}
  \item{NEEColName}{collumn name for NEE}
  \item{TempColName}{collumn name for air temperature}
  \item{RgColName}{collumn name for solar radiation for omitting night time data}
  \item{seasonFactor.v}{factor for subsetting times see details}
  \item{ctrlUstarEst.l}{control parameters for estimating uStar on a single binned series, see \code{\link{controlUstarEst}}}
  \item{ctrlUstarSub.l}{control parameters for subsetting time series (number of temperature and Ustar classes \ldots), see \code{\link{controlUstarSubsetting}}}
  \item{fEstimateUStarBinned}{function to estimate UStar on a single binned series, see \code{\link{estUstarThresholdSingleFw2Binned}}}
  \item{isCleaned}{set to TRUE to avoid call to \code{\link{cleanUStarSeries}}.}
}
\details{The threshold for sufficiently turbulent conditions u* (Ustar) 
is estimated for different subsets of the time series.
From the estimates for each season (each value in \code{seasonFactor.v} 
the maximum is reported as global estimate.
Within each season the time series is split by temperature classes. 
Among these Ustar estimates, the median is reported as season value.

In order to split the seasons, the uses has provide a vector with argument \code{seasonFactor.v}
where rows with the same value belong to
the same season. It is conveniently generated by one of the following functions:
\itemize{
\item{ \code{\link{createSeasonFactorMonth}} (default DJF-MAM-JJA-SON) }
\item{ \code{\link{createSeasonFactorYday}} }
} 

The estimation of Ustar on a single binned series can be selected argument \code{fEstimateUStarBinned}.
\itemize{
\item{ \code{\link{estUstarThresholdSingleFw1Binned}} }
\item{ \code{\link{estUstarThresholdSingleFw2Binned}} (default) }
} 

This function is usually called by
\itemize{
\item{ \code{\link{sEstUstarThresholdYears}} that applies this function to subsets of each year. }
\item{ \code{\link{sEstUstarThresholdDistribution}} which additionally estimates median and confidence intervals for each year by bootstrapping the original data.}
} }
\value{A list with entries
\item{UstarAggr}{numeric scalar: Ustar threshold estimate:  max_Seasons( median_TempClasses )}
\item{UstarSeasonTemp}{numeric matrix (nSeason x nTemp): estimates for each subset
}}
\references{Ustar filtering following the idea in Papale 2006	}
\author{(Department for Biogeochemical Integration at MPI-BGC, Jena, Germany)}




\examples{
Dir.s <- paste(system.file(package='REddyProc'), 'examples', sep='/')
EddyData.F <- ds <- fLoadTXTIntoDataframe('Example_DETha98.txt', Dir.s)
EddyDataWithPosix.F <- ds <- fConvertTimeToPosix(EddyData.F, 'YDH', Year.s='Year', Day.s='DoY', Hour.s='Hour')
EddyProc.C <- sEddyProc$new('DE-Tha', EddyDataWithPosix.F, c('NEE','Rg','Tair','VPD','Ustar'))   
#ds <- head(ds,2000)
(res <- EddyProc.C$sEstUstarThreshold())
}