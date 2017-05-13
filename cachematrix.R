## This functions calculate the inverse of a matrix using cache to avoid
## extra calculations. In this assignment is used <<- operator which can
## be used to assign a value to an object in an environment that is 
## different from the current environment. 

## This function receives a matrix and assign the values passed through
## the functions set and setinverse to the correspondance values.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function receives a matrix object and if the inverse of the matrix
## is already calculated the function prints the result, otherwise it calculates
## the inverse and print it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
