library(tidyverse)
library(ggtext)
library(ggrepel)

theme_set(
  firasans::theme_ipsum_fsc(
    axis_text_family = "Fira Sans Condensed",
    axis_text_size = 10, 
    axis_title_size = 14,
    axis_title_just = "cc") +
    theme(panel.grid.minor = element_blank(),
          plot.title = element_markdown(face = "plain"),
          plot.subtitle = element_markdown(),
          plot.caption = element_markdown(),
          plot.title.position = "plot",
          axis.title.x = element_blank(),
          axis.title.y = element_blank())
)

read_rds(here::here("data", "incidence.rds")) %>% 
  ggplot(aes(x = Year, y = `Age-Adjusted Rate`, color = Race)) + 
  geom_line(show.legend = FALSE) + 
  geom_label_repel(aes(label = label, color = Race), 
                   label.size = 0,
                   show.legend = FALSE, na.rm = TRUE, 
                   nudge_x = -1, nudge_y = c(8, 11, 9), 
                   min.segment.length = unit(1, "in")) + 
  ggsci::scale_color_jama() + 
  labs(
    title = "US prostate cancer incidence, 1999-2016",
    subtitle = "Age-adjusted rate per 100,000",
    caption = "Source: wonder.cdc.gov <br>Accessed: 2020-05-06"
  )

ggsave(here::here("plots", "gg-incidence.png"), 
       device = "png",
       width = 10,
       height = 8,
       units = "in")
