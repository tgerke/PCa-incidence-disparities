Prostate cancer disparities data visualization
=====================

_This is a quick show of gratitude for how ggplot's elegance and simplicity has totally transformed the way high-quality figures can be generated._

For a current project describing racial disparities in prostate cancer outcomes, I needed to plot some CDC incidence data over time. [CDC](https://www.cdc.gov/cancer/dcpc/research/articles/cancer_2020_incidence.htm) provides the below plot of such data and it's :grimacing: :grimacing: :grimacing:.

![](plots/cdc-site-plot.png)

Since that won't do, I need to roll my own. You can get the underlying incidence data from [https://wonder.cdc.gov/](https://wonder.cdc.gov/). In short order, I came up with the following the ggplot version.

![](plots/gg-incidence.png)

For kicks, I thought I would spend the same amount of time doing what I did for the better part of a decade: doing this same plot in base R. The result is still better than the CDC version, but it doesn't come close to the shine of the ggplot figure. On top of this, portions of that base code are not nearly as human-readable (without excessive staring) as the ggplot version; both of these scripts can be found in the `R/` directory within this repository.

![](plots/base-plot.png)
