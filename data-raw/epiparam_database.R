library(epiparameter)

# Load the epiparameter database and extract unique diseases and distributions.
# Return the database and the unique diseases and distributions for use in the
# app.
# Load the database from epiparameter
epi_dist_db <- epiparameter::epidist_db()
# Extract unique diseases and distributions
unique_diseases <- unique(
  sapply(
    epi_dist_db,
    function(x)x$disease$disease
  )
)
unique_epidists <- unique(
  unique(
    sapply(
      epi_dist_db,
      function(x) x$epi_dist
    )
  )
)

epiparameter_data <-  list(
  param_database = epi_dist_db,
  unique_diseases = unique_diseases,
  unique_epidists = unique_epidists
)

usethis::use_data(epiparameter_data, overwrite = TRUE)
