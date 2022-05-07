---
title: "Hands-on excercise 4"
description: |
  A new article created using the Distill format.
author:
  - name: Huang Anni 
    url: https://example.com/norajones
    affiliation: "Singapore Management University"
    affiliation_url: https://www.smu.edu.sg/
date: "2022-05-07"
output:
  distill::distill_article:
    toc: true
    toc_depth: 3
---



To start with, [ggstatsplot](https://indrajeetpatil.github.io/ggstatsplot/) and tidyverse packages will be launched using library().

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>packages</span> <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='st'>'ggiraph'</span>, <span class='st'>'plotly'</span>, <span class='st'>'tidyverse'</span>, <span class='st'>'DT'</span>,<span class='st'>'gganimate'</span>,
             <span class='st'>'knitr'</span>, <span class='st'>'ggdist'</span>, <span class='st'>'scales'</span>, <span class='st'>'grid'</span>, <span class='st'>'gridExtra'</span>,
             <span class='st'>'patchwork'</span>,<span class='st'>'ggsignif'</span>,<span class='st'>'gghighlight'</span>,<span class='st'>"hrbrthemes"</span>,
             <span class='st'>'readxl'</span>, <span class='st'>'gifski'</span>, <span class='st'>'gapminder'</span>,<span class='st'>'treemap'</span>, <span class='st'>'treemapify'</span>,
             <span class='st'>'rPackedBar'</span>,<span class='st'>'ggridges'</span>,<span class='st'>'rmarkdown'</span>,<span class='st'>'ggstatsplot'</span><span class='op'>)</span>

<span class='kw'>for</span><span class='op'>(</span><span class='va'>p</span> <span class='kw'>in</span> <span class='va'>packages</span><span class='op'>)</span> <span class='op'>{</span>
  <span class='kw'>if</span><span class='op'>(</span><span class='op'>!</span><span class='kw'><a href='https://rdrr.io/r/base/library.html'>require</a></span><span class='op'>(</span><span class='va'>p</span>, character.only <span class='op'>=</span> <span class='cn'>T</span><span class='op'>)</span><span class='op'>)</span> <span class='op'>{</span>
    <span class='fu'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='op'>(</span><span class='va'>p</span><span class='op'>)</span>
  <span class='op'>}</span>
  <span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='op'>(</span><span class='va'>p</span>, character.only <span class='op'>=</span> <span class='cn'>T</span><span class='op'>)</span>
<span class='op'>}</span>
</code></pre></div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>exam</span> <span class='op'>&lt;-</span> <span class='fu'>read_csv</span><span class='op'>(</span><span class='st'>"./data/Exam_data.csv"</span><span class='op'>)</span>
</code></pre></div>

</div>


# ANOVA test

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>1234</span><span class='op'>)</span>
<span class='fu'>ggbetweenstats</span><span class='op'>(</span>
  data <span class='op'>=</span> <span class='va'>exam</span>,
  x <span class='op'>=</span> <span class='va'>RACE</span>,
  y <span class='op'>=</span> <span class='va'>ENGLISH</span>,
  type <span class='op'>=</span> <span class='st'>"np"</span> <span class='co'># non-parametrics</span>
<span class='op'>)</span>
</code></pre></div>
<img src="in-class-ex-04_files/figure-html5/unnamed-chunk-3-1.png" width="624" />

</div>






```{.r .distill-force-highlighting-css}
```
