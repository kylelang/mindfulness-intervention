options(width = 80)

## The following code will render scrollable text output when the `max-height`
## chunk option is set 
## (https://bookdown.org/yihui/rmarkdown-cookbook/hook-scroll.html)
local({
  hook_output <- knitr::knit_hooks$get('output')
  
  knitr::knit_hooks$set(
    output = function(x, options) {
      
      if (!is.null(options$max.height)) 
        options$attr.output <- c(
          options$attr.output,
          sprintf('style="max-height: %s;"', options$max.height)
        )
      
      hook_output(x, options)
    }
  )
})
