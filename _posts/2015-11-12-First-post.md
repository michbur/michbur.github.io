---
title: "First post"
author: "Michal Burdukiewicz"
date: "2015-11-12 13:00:00"
output: html_document
layout: post
comments: true
categories:
- varia
---

# Very brief introduction

This blog is devoted to my experience with R. I will especially focus on obscure R packages that I found interesting and useful.

Below I'm testing some features of my blog, like:

# MathJax

$$
y = x^2 + x
$$

# Embedding and printing R code


{% highlight r %}
library(dplyr)
dat <- data.frame(x = -100:100) %>% 
  mutate(y = x^2 + x)

head(dat)
{% endhighlight %}



{% highlight text %}
##      x    y
## 1 -100 9900
## 2  -99 9702
## 3  -98 9506
## 4  -97 9312
## 5  -96 9120
## 6  -95 8930
{% endhighlight %}

# Nice tables


{% highlight r %}
kable(head(dat))
{% endhighlight %}



|    x|    y|
|----:|----:|
| -100| 9900|
|  -99| 9702|
|  -98| 9506|
|  -97| 9312|
|  -96| 9120|
|  -95| 8930|

# Figures


{% highlight r %}
plot(dat, type = "l")
{% endhighlight %}

![plot of chunk unnamed-chunk-3]({{ site.url }}/images/2015-11-12-First-post/unnamed-chunk-3-1.svg) 
