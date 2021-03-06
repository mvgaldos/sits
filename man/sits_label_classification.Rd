% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_classification.R
\name{sits_label_classification}
\alias{sits_label_classification}
\title{Post-process a classified data raster probs to obtain a labelled image}
\usage{
sits_label_classification(
  cube,
  smoothing = "none",
  window = matrix(1, nrow = 3, ncol = 3, byrow = TRUE),
  variance = 20,
  output_dir = "./",
  version = "v1"
)
}
\arguments{
\item{cube}{Classified image data cube.}

\item{smoothing}{(optional) smoothing method to be applied
("none", "bayesian", "majority")}

\item{window}{A matrix with the neighborhood window
to compute bayesian smooth.
The central element index (i, j) is given by
i = floor(nrows(window)/2)+1 and
j = floor(ncols(window)/2)+1.
Elements '0' are excluded from window.}

\item{variance}{Estimated variance of logit of class_probs
(Bayesian smoothing parameter).}

\item{output_dir}{Output directory where to out the file}

\item{version}{Version of resulting image
(in the case of multiple tests)}
}
\value{
A tibble with metadata about the output RasterLayer objects.
}
\description{
Takes a set of classified raster layers with probabilities,
             whose metadata is]created by \code{\link[sits]{sits_cube}},
             and label them, with an optional bayesian smoothing process.
}
\examples{
\donttest{
# Retrieve the samples for Mato Grosso
# select the band "ndvi"

samples_ndvi <- sits_select_bands(samples_mt_4bands, ndvi)

#select a random forest model
rfor_model <- sits_train(samples_ndvi, ml_method = sits_rfor())

# Classify a raster file with 23 instances for one year
files <- c(system.file("extdata/raster/mod13q1/sinop-crop-ndvi.tif",
                       package = "sits"))

# create a data cube based on the information about the files
sinop <- sits_cube(type = "BRICK", satellite = "TERRA",
                   sensor = "MODIS", name = "Sinop-crop",
                   timeline = timeline_modis_392,
                   bands = c("ndvi"), files = files)

# classify the raster image
sinop_probs <- sits_classify(sinop, ml_model = rfor_model,
                                    memsize = 2, multicores = 1)

# label the classified image
sinop_label <- sits_label_classification(sinop_probs)

# plot the raster image
plot(sinop_label, time = 1, title = "Sinop-2013-2014")

# smooth the result with a bayesian filter
sinop_bayes <- sits_label_classification(sinop_probs, smoothing = "bayesian")

# plot the smoothened image
plot(sinop_bayes, time = 1, title = "Sinop-smooth")

# remove the files (cleanup)
file.remove(unlist(sinop_probs$files))
file.remove(unlist(sinop_label$files))
file.remove(unlist(sinop_bayes$files))
}
}
\author{
Rolf Simoes, \email{rolf.simoes@inpe.br}
}
