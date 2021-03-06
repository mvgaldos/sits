# satellite image time series package (SITS)
# example of clustering using self-organizin maps
library(sits)

#Clustering time series samples using self-organizing maps
som_map <-
    sits_som_map(
        prodes_226_064,
        grid_xdim = 10,
        grid_ydim = 10,
        alpha = 1,
        distance = "euclidean",
        iterations = 100
    )

plot(som_cluster)

#Remove samples that have  bad quality
new_samples.tb <- sits_som_clean_samples(som_map)

#Evaluate the quality of the clusters generated by SOM
summary_overall <- sits_som_evaluate_cluster(som_map)
plot(summary_overall)
