\name{fCheckHHTimeSeries}
\alias{fCheckHHTimeSeries}
\title{fCheckHHTimeSeries}
\description{Check half-hourly time series data}
\usage{fCheckHHTimeSeries(Time.V.p, DTS.n, CallFunction.s = "")}
\arguments{
  \item{Time.V.p}{Time vector in POSIX format}
  \item{DTS.n}{Number of daily time steps (24 or 48)}
  \item{CallFunction.s}{Name of function called from}
}
\details{The number of steps per day can be 24 (hourly) or 48 (half-hourly).

The time stamp needs to be provided in POSIX time format,

equidistant half-hours,

and stamped on the half hour.

The sEddyProc procedures require at least three months of data.

Full days of data are preferred: the total amount of data rows should be a multiple of the daily time step, and

in accordance with FLUXNET standards, the dataset is spanning from the end of the first (half-)hour (0:30 or 1:00, respectively) and to midnight (0:00).}
\value{Function stops on errors.}

\author{AMM
(Department for Biogeochemical Integration at MPI-BGC, Jena, Germany)}





