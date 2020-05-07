incidence <- readRDS(here::here("data", "incidence.rds"))

png(here::here("plots", "base-plot.png"), 
    width = 10,
    height = 8, 
    units = "in", 
    res = 300)
plot(x = incidence$Year[incidence$Race == "White"], 
     y = incidence$`Age-Adjusted Rate`[incidence$Race == "White"], 
     type = "l",
     ylim = range(incidence$`Age-Adjusted Rate`),
     xlab = NA,
     ylab = "Age-adjusted rate per 100,000", 
     main = "US prostate cancer incidence, 1999-2016")
lines(incidence$Year[incidence$Race == "Black"], 
      incidence$`Age-Adjusted Rate`[incidence$Race == "Black"], 
      lty = 2)
lines(incidence$Year[incidence$Race == "Asian/PI"], 
      incidence$`Age-Adjusted Rate`[incidence$Race == "Asian/PI"], 
      lty = 3)
legend("topright", 
       legend = c("White", "Black", "Asian/PI"),
       lty = 1:3)
dev.off()
