## Put comments here that give an overall description of what your
## functions do

## Below are two functions that are used to create a special object 
##that stores a numeric vector and cache's its mean.
##this function creates a special matrix object and can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x<<- y
inv <<-NULL 
}
get <- function() x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
list(set = set,
get = get,
setInverse = setInverse,
getInverse = getInverse)

}


## this function solves the inverse of the matrix created by the above makeCachematrix
## if inver has been calculated , it retrieves the inverse from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInverse()
	if(!is.null(inv))
{
		message("getting cached data")
		return(inv)
}
mat <- x$get()
inv <- solve(mat, ...)
x$setInverse(inv)
inv
}
