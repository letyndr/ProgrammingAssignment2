## This functions calculate the inverse of a matrix using cache to avoid
## extra calculations. In this assignment it was used <<- operator which 
## can be used to assign a value to an object in an environment that is 
## different from the current environment. 

## This function receives a matrix and assign the values passed through
## the functions set and setinverse to the correspondance values.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  # Usage of the special operator <<- which assign a value to an object
  # from a different environment.
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  # Returned list of different objects of this function.
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function receives a matrix object and if the inverse of the matrix
## was already calculated, the function prints the result, otherwise it 
## calculates the inverse and prints it.

cacheSolve <- function(x, ...) {
  
  inv <- x$getinverse()
  # if the inverse is already computed it just returns the inverse.
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  # If the inverse is not calculated (otherwise we could recover the value),
  # get the original matrix and store in data.
  data <- x$get()
  # Calculate the inverse.
  inv <- solve(data)
  # Set the inverse matrix.
  x$setinverse(inv)
  # Return the inverse.
  inv
}

# Output sample:
# 
# > source("cachematrix.R")
# > m1 <- makeCacheMatrix(matrix(c(4, 2, 7, 6), 2, 2))
# > cacheSolve(m1)
#       [,1] [,2]
# [1,]  0.6 -0.7
# [2,] -0.2  0.4
