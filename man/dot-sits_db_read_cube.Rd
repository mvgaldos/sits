% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sits_db.R
\name{.sits_db_read_cube}
\alias{.sits_db_read_cube}
\title{Read cube information from an SQLite database}
\usage{
.sits_db_read_cube(conn, name, cubes)
}
\arguments{
\item{conn}{SQLite connection}

\item{name}{Name of the cube table to be retrieved}

\item{cubes}{Tibble with cubes information}
}
\value{
data     Tibble with metadata about the cube
}
\description{
This functions write a tibble with metadata about a cube
to an RSQLite database.
}
\author{
Gilberto Camara, \email{gilberto.camara@inpe.br}
}
