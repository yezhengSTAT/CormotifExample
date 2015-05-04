\name{CormotifExample}
\docType{data}
\alias{CormotifExample}
\alias{groupid}
\alias{compid}
\alias{simulationData}
\title{Simulation results for Correlation Moitfs model}
\description{
  This is the result for Correlation Motifs model using simulated
  data. The raw simulated data are also available in this demo package.
}
\usage{ data(CormotifExample) }

\details{

  More usage see the examples 
}
\source{
  Wei, Yingying, Toyoaki Tenzen, and Hongkai Ji. "Joint analysis of differential gene expression in multiple studies using correlation motifs." \emph{Biostatistics} 16.1 (2015): 31-46.
}
\examples{

library(Cormotif)

#1. Correlation Motifs model can be build from the raw simulated data
data(simulationData)
data(groupid)
data(compid)

exprs <- as.matrix(simulationData[,2:ncol(simulationData)])

#Correlation Motif simulation result
result <- cormotiffit(exprs, groupid, compid, K = 1:10, max.iter = 1000, BIC = TRUE)

#Optimal cluster number K is obtained by BIC
K <- which.min(result$bic[,'bic'])

#The posterior probability for each gene in each study to bedifferential expressed.
posterior <- result$bestmotif$p.post
cutoff <- 0.5
diffExprs <- (posterior > cutoff)

#Rank the gene by the posterior probability
topgenelist <- generank(posterior)

#2. Correlation Motifs model result can be loaded directly
data(CormotifExample)

#3. Visual result


plotMotif(result)

head(diffExprs)

head(topgenelist)


}
\keyword{datasets}
