library(knitr)

single_post <- list.files("rmd_posts/")


# using tips from http://brooksandrew.github.io/simpleblog/articles/blogging-with-r-markdown-and-jekyll-using-knitr/
# and http://francojc.github.io/publishing-rmarkdown-to-wordpress-or-jekyll/
# and http://nicolewhite.github.io/2015/02/07/r-blogging-with-rmarkdown-knitr-jekyll.html

# opts_chunk$set(fig.path=fig.dir, 
#                fig.width=8.5,
#                fig.height=5.25, 
#                dev='svg', 
#                cache=FALSE, 
#                warning=FALSE, 
#                message=FALSE, 
#                cache.path=cache.path, 
#                tidy=FALSE) 


render_post <- function(single_post) {
  opts_chunk$set(fig.path = paste0("./images/", sub(".Rmd$", "", single_post), "/"),
                 fig.width = 8.5,
                 fig.height = 5.25, 
                 dev = "svg")
  
  render_jekyll(highlight = "pygments")
  output_name <- paste0("./_posts/", sub("Rmd$", "md", single_post))
  knit(paste0("./rmd_posts/", single_post), 
       output = output_name,
       envir = parent.frame(), 
       quiet = TRUE)

  all_lines <- readLines(output_name)
  
  #change adress of figures
  img_lines_id <- grep("./images/", all_lines)
  all_lines[img_lines_id] <- sub("./images/", "{{ site.url }}/images/", all_lines[img_lines_id])
  writeLines(all_lines, output_name)
  print("Done")
}

sapply(list.files("rmd_posts/"), render_post)
