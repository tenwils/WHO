# Get data and and convert to R format function

get.data <- function(url){
  response <- GET(url)
  
  # Check if the request was successful
  if (http_status(response)$category == "Success") {
    data <- fromJSON(content(response, as = "text"), flatten = TRUE)
    
    if (is.null(data$value)) {
      print("API returned successfully, but no data found in 'value'.")
      print("Here is the structure of the returned data:")
      str(data) # Print structure for debugging
      return(NULL) # Return NULL to indicate no data
    } else {
      print("Data fetched successfully!")
      return(data$value)
    }

  } else {
    stop("Failed to fetch data. Check the API endpoint or internet connection.")
  }
  # return(data$value)
}