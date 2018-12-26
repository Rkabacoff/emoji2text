#'@title Convert emojis to text
#'
#'
#'@description
#'\code{emoji_to_text} applies replaces emojis and accents with
#' corresponding english characters/phrases in a vector of strings.
#'
#'
#'@details
#'This function identifies emojis and accents within a text string and replaces them
#'with their corresponding english characters/phrases using \code{\link{Emojis}} and \code{\link{Accents}} reference dataframes.
#'
#'
#'@param vector a vector of character strings.
#'@param accents a boolean which is TRUE if user wants to replace accents, and FALSE otherwise.
#'@param delete a boolean which is TRUE if user wants to delete bytes that are not matched to an emoji or accent.
#'
#'@import dplyr
#'@import stringr
#'@return a vector of character strings.
#'
#'@author Kelly Jamrog <kjamrog@@wesleyan.edu>
#'@author Jacob Kuruvilla <jkuruvilla@@wesleyan.edu>
#'@author Kim Pham <spham@@wesleyan.edu>
#'
#'@export
#'@examples
#'\dontrun{
#'test <- c("Hi Röb, whats up 😬")
#'emoji_to_text(test, accents=TRUE)
#'#[1] "Hi Rob, whats up (grimacing face)"
#'}


emoji_to_text <- function(vector, accents = FALSE, delete = FALSE) {
  
  # replace emojis and accents in a string
  emoji_to_text_for_one <- function(text, accents, delete){
    for (i in 1:length(Emojis$byte)) {
      if (str_detect(text, Emojis$byte[i])) {
        text <- str_replace_all(text, Emojis$byte[i], Emojis$words[i])
      }
      next
    }
    
    if(accents == TRUE) {
      for (i in 1:length(Accents$byte)) {
        if (str_detect(text, Accents$byte[i])) {
          text <- str_replace_all(text, Accents$byte[i], Accents$words[i])
        }
        next
      }
    }
    
    if(delete == TRUE) {
      text <- gsub("<[A-Za-z0-9]{2}>", "", text)
    }
    
    return(text)
  }
  
  # apply function to a vector of strings
  # add catch for if do not enter a string
  if(!inherits(vector, "character")) {stop("Vector must be type char")}

  unlist(lapply(vector, function(x){
    x <- iconv(x, from = "UTF8", to = "ascii", sub = "byte")
    emoji_to_text_for_one(x, accents, delete)
  }))
}
