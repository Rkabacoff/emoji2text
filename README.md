<img src="emojis.png">

# emoji2text

The goal of emoji2text is to replace emojis, as well as accent characters, with descriptive phrases  prior to text mining and sentiment analysis. For example,


```"I have to go to bed now! 😔 Good night!😠😠😠"```

   becomes

```"I have to go to bed now! (pensive face) Good night! (angry face)(angry face)(angry face)"```

## Installation

You can install this package with the following code:

``` r
if(!require(devtools)){
   install.packages("devtools")
}
devtools::install_github("rkabacoff/emoji2text")
```

