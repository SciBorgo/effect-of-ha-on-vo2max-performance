
#### Waldron et al.
# Meta analysis
# Author: DN Borg
# Date: 22 Apr 2021

# Libraries
library(dplyr)
library(janitor)
library(naniar)
library(meta)
library(metafor)
library(dmetar)
library(readxl)

d = read_xlsx("data-ha-versus-con.xlsx",1)
vis_miss(d)

# thermoneutral performance
d_therm <- d %>%
  filter(test_enviro == "thermo")

# Making sure only unique studies
d_therm %>% group_by(study_id) %>%
  summarise(count = n())

# Number of unique studies
length(unique(d_therm$study_id))

# Look at names
sort(names(d_therm))

# Meta analysis
# Details: https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/random.html
meta_fit <- metacont(n.e = n_con, # flipped for direction
                     mean.e = mu_con, # flipped for direction
                     sd.e = sd_con, # flipped for direction
                     n.c = n_exp, # flipped for direction
                     mean.c = mu_exp, # flipped for direction
                     sd.c = sd_exp, # flipped for direction
                     data = d_therm,
                     studlab = paste(study_id),
                     comb.fixed = F,
                     comb.random = T,
                     prediction = T,
                     sm = "SMD",
                     method.smd = "Hedges",
                     method.tau = "SJ")
meta_fit
summary(meta_fit)

png(file = 'vo2max-perf-thermo.png', width = 10, height = 5.25, res = 600, units = "in") 
forest(meta_fit, 
       sortvar = TE,
       xlim = c(-4,4),
       xlab ="Favours Con                SMD                 Favours HA",
       rightlabs = c("g","95% CI","Weight"),
       leftlabs = c("Author (year)", "N","Mean","SD","N","Mean","SD"),
       lab.e = "Heat acclimation",
       lab.c = "Control",
       pooled.totals = T,
       smlab = "",
       text.random = "Overall effect",
       print.tau2 = T,
       col.diamond = "gray",
       col.diamond.lines = "black",
       col.predict = "black",
       print.I2.ci = F,
       digits.sd = 1,
       digits.mean = 1,
       mlab = "",
       ilab.xpos = 8,
       ilab.pos = 8,
       showweights = T)
dev.off()
