# Load MASS and ISLR libraries
LoadLibraries <- function(ds = NULL) {
    # Import libraries
    library(MASS)
    library(ISLR)

    if (!is.null(ds)) {
        names(ds)
        fix(ds)
    }
}
