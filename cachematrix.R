# Function makeCacheMatrix creates a list that contains
# 4 functions: set, get, setInv and getInv.
# This list is used as the input to function cacheSolve()
# it uses <<- assignment operator so that
# these internal variables are not exposed to the
# outside environment. 
makeCacheMatrix <- function(x = matrix()) {
  xinv <- NULL
  # this is where the result of inversion is stored
  # A setter function, use this to set a matrix to object
  # created by makeCacheMatrix function
  # e.g makeCacheMatrix(testmatrix)
  # here we work on testmatrix
  # makeCacheMatrix$set(testmatrix1)
  # here we work on testmatrix1
  set <- function(y) {
    x <<- y
    xinv <<- NULL
    # it also initialises xinv to null
  }
  get <- function() x
  # return the input matrix
  setInv <- function(inv) xinv <<- inv
  # set the inversed matrix
  getInv <- function() xinv
  # return the inversed matrix
  # return a list that contains these functions, 
  # so that we can use makeCacheMatrix object like these
  # x <- makeCacheMatrix(testmatrix)
  # x$set(newmatrix) # to change matrix
  # x$get # to get the setted matrix
  # x$setInv # to set the inversed matrix
  # x$getInv # to get the inversed matrix
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


# Function cacheSolve () return a matrix
# that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  m <- x$getInv()
  # get the inversed matrix from object x
  # it will be null if uncalculated,
  # remember the first line "xinv <- NULL"
  # in the previous function
  if(!is.null(m)) {
    # if the inversion result is there
    message("getting cached data")
    return(m)
    # return the calculated inversion   
  }
  data <- x$get()
  # if not, we do x$get to get the matrix object
  m <- solve(data)
  # we solve it
  x$setInv(m)
  # we then set it to the object
  m
  # return the solved result
}

