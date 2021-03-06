% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_plot.R
\name{plot.som_confusion}
\alias{plot.som_confusion}
\title{Plot information about confunsion between clusters}
\usage{
\method{plot}{som_confusion}(x, y, ..., title = "Confusion by cluster")
}
\arguments{
\item{x}{object of class "som_confusion"}

\item{y}{ignored}

\item{...}{further specifications for \link{plot}.}

\item{title}{Title of plot. default is ""Confusion by cluster"".}
}
\value{
input object (useful for chaining)
}
\description{
Plot a bar graph with informations about each cluster.
The percentage of mixture between the clusters.
}
\examples{
\donttest{
# Produce a cluster map
som_map <- sits_som_map(prodes_226_064)
# Evaluate the clusters
cluster_overall <- sits_som_evaluate_cluster(som_map)
# Plot confusion between the clusters
plot(cluster_overall)
}
}
\author{
Lorena Santos \email{lorena.santos@inpe.br}
}
