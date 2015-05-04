library(Cormotif)

data <- read.table("~/simulationData.txt", head = TRUE)
groupid <- read.table("~/groupid.txt", head = TRUE)
compid <- read.table("~/compid.txt", head = TRUE)

exprs <- as.matrix(data[,2:dim(data)[2]])

result <- cormotiffit(exprs, groupid, compid, K = 1:10, max.iter = 1000, BIC = TRUE)
K <- which.min(result$bic[,'bic'])
plotMotif(result)

posterior <- result$bestmotif$p.post
cutoff <- 0.5
diffExprs <- (posterior > cutoff)
head(diffExprs)

topgenelist <- generank(posterior)
head(topgenelist)

save.image("~/CormotifExample.Rdata")
