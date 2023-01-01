add_html_id <- function (){
  file_html <- 
    rstudioapi::getSourceEditorContext()$path %>% 
    str_replace(.,".Rmd",".html")
  x <- readLines(file_html)
  x1 <- which(str_detect(x,"<h[:digit:]"))
  
  for (i in x1){
    y <- x[i] %>% str_replace(.,">.*","") %>%
      paste0(., " id = \"",i,"\">")
    x[i] <- x[i] %>% 
      str_replace(.,".*<h[:digit:]>","") %>%
      paste0(y,.)
  }
  writeLines(x,file_html)
}
  