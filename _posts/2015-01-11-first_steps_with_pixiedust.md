---
title: "First steps with pixiedust"
author: "Michal Burdukiewicz"
date: "2016-01-11 21:00:00"
output: html_document
layout: post
comments: true
categories:
  - R
---

I'm a fond user of the [xtable](https://cran.r-project.org/package=xtable). There are many alternatives, as **kable** from [kable](https://cran.r-project.org/package=knitr), but I have still preferred my old golden standard. Nevertheless, I'm always trying to learn something new and the [pixiedust](https://cran.r-project.org/package=pixiedust) package immediately caught my eye. It uses pipes, works for many outputs (see [HERE](https://cran.r-project.org/web/packages/pixiedust/vignettes/sprinkles.html) ) and seems to be really flexible.


{% highlight r %}
# let's load some data...
data(airquality)
# ...and save only part of it
dat <- airquality[1L:5, ]

# Load package and try it's powers
library(pixiedust)

# Standard html output
dust(dat) %>% sprinkle_print_method("html")
{% endhighlight %}



{% highlight text %}
## Error in print_dust_html(x, ...): attempt to apply non-function
{% endhighlight %}



{% highlight r %}
# Use pixiedust magic
dust(dat) %>% sprinkle_print_method("html") %>% 
  sprinkle(cols = 1, border_color = "red", border_style = "dashed") %>% # change border color and bold column
  sprinkle(rows = 1L:3, cols = 3, bg = "green", italic = TRUE, font_size = 18) %>% # change only three cells
  sprinkle(bg = "yellow", part = "head") # format column names
{% endhighlight %}



{% highlight text %}
## Error in print_dust_html(x, ...): attempt to apply non-function
{% endhighlight %}
