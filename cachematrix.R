## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {                        ##argument is defined with default mode of "matrix"

        inv <- NULL                                                       ## initializing inv as NULL will hold value of matrix inverse 
        set <- function(y) {                                       ## set function is defined to assign new

                x <<- y                                            ## value of matrix in parent environment

                inv <<- NULL                                       ## if found new matrix, inv is reset to NULL
        }

        get <- function() x                                        ## get fucntion is defined to return value of the matrix argument
        setInverse <- function(inverse) inv <<- inverse            ## assigns value of inv in parent environment
        getInverse <- function() inv                               ## gets the value of inv where called
        list(set = set,                                            ##you need this in order to refer to the functions with the $ operator
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
}

 mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}
