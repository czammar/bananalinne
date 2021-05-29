library(haven)
library(tidyverse)
library(stargazer)

# Read data
gbdcovar <- read_dta("/Users/cesar/github/bananalinne/Examen/gbdcovar.dta")

# Filtering location_id to obtain country-level data following columns B & C
# from file IHME_GBD_2019_COV_1980_2019_CODEBOOK_Y2020M10D15.CSV
df <- gbdcovar %>% filter(location_id > 1, location_id <=435, 
                          age_group_id == 8)

# Enconding of sex_id variable (female=1,male=2)-> (female=0,male=1)
df$sex_id <- as.integer(df$sex_id)-1

df <- df %>% mutate(new_id = group_indices(df, .dots=c("location_id", "sex_id", "age_group_id"))) 

##


# OLS Models
m1 <-lm(alc_binge ~ edu_aaid + uhc, data = df)
m2 <-lm(alc_binge ~ edu_aaid + uhc + factor(sex_id), data = df)
m3 <-lm(alc_binge ~ edu_aaid + uhc + factor(sex_id)+ sev_alcohol+ sev_drugs, data = df)
m4 <-lm(alc_binge ~ edu_aaid + uhc + factor(sex_id)+ factor(age_group_id)+sev_alcohol+ sev_drugs, data = df)


# Display summary of all models
stargazer(m1, m2, m3,
          type="text", 
          out="models.txt")

# PLM models
df_pan <- pdata.frame(df, index=c("new_id","year_id"))

fixed <- plm(alc_binge ~ edu_aaid + gdp + uhc + sex_id + age_group_id, data=df_pan, model="within")
summary(fixed)

summary(fixef(fixed, type="dmean"))

#stargazer(m1,type="text")

# plots %>% 
df %>% ggplot(aes(x=alc_binge, fill=as.factor(sex_id))) + 
  geom_density(alpha=.3) +
  facet_wrap(age_group_id ~ .)


df %>% filter(location_id >10, location_id <20) %>% ggplot(aes(x = year_id, y = alc_binge)) + 
  geom_line(aes(color = as.factor(sex_id)), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  theme_minimal()+
  facet_wrap(location_name ~ .)


library(reshape2)
library(ggcorrplot)


# Compute a correlation matrix
df_num <- df %>% select(-covariate_id,covariate_name_short, latitude, new_id, -location_id, -sex_id, -age_group_id, -year_id, -age_yrs_med,-physact,-sev_act,-sev_transfat,-sev_kidney) %>% dplyr::select(where(is.numeric)) 

corr <- round(cor(df_num), 1)

# Compute a matrix of correlation p-values
p.mat <- cor_pmat(df_num)

# Visualize the lower triangle of the correlation matrix
# Barring the no significant coefficient
corr.plot <- ggcorrplot(
  corr, hc.order = TRUE, type = "lower", outline.col = "white",
  p.mat = p.mat, lab = TRUE
)
corr.plot

#

library(psych)

df_pp <- df %>% select(alc_binge, bmd, choles, diabetes_015, educ, edu_aaid,sex_id)

pairs.panels(df_pp, 
             method = "pearson", # correlation method
             hist.col = "#00AFBB",
             density = TRUE,  # show density plots
             ellipses = TRUE # show correlation ellipses
)