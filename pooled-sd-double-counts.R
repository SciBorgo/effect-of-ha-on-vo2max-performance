# Pooled sd
# https://handbook-5-1.cochrane.org/chapter_16/16_5_4_how_to_include_multiple_groups_from_one_study.htm


# Gore (1997) intervention group
mu_1 = 57.7
mu_2 = 50
sd_1 = 2.7
sd_2 = 5.2
n_1 = 4
n_2 = 5

pooled_mu = (mu_1+mu_2)/2
pooled_mu

pooled_sd = sqrt(((n_1-1)*(sd_1^2) + (n_2-1)*(sd_2^2))/(n_1+n_2-2))
pooled_sd

combined_n = n_1+n_2  
combined_n

# Gore (1997) control group
mu_1 = 56.9
mu_2 = 53.1
sd_1 = 0.9
sd_2 = 1.2
n_1 = 6
n_2 = 4

pooled_mu = (mu_1+mu_2)/2
pooled_mu

pooled_sd = sqrt(((n_1-1)*(sd_1^2) + (n_2-1)*(sd_2^2))/(n_1+n_2-2))
pooled_sd

combined_n = n_1+n_2  
combined_n

# Willmott (2018) intervention group
mu_1 = 51.2
mu_2 = 51.7
sd_1 = 6.7
sd_2 = 5.9
n_1 = 10
n_2 = 10

pooled_mu = (mu_1+mu_2)/2
pooled_mu

pooled_sd = sqrt(((n_1-1)*(sd_1^2) + (n_2-1)*(sd_2^2))/(n_1+n_2-2))
pooled_sd

combined_n = n_1+n_2  
combined_n

# Willmott (2018) control group
mu_1 = 49.5
mu_2 = 49.6
sd_1 = 5.8
sd_2 = 4.1
n_1 = 10
n_2 = 10

pooled_mu = (mu_1+mu_2)/2
pooled_mu

pooled_sd = sqrt(((n_1-1)*(sd_1^2) + (n_2-1)*(sd_2^2))/(n_1+n_2-2))
pooled_sd

combined_n = n_1+n_2  
combined_n

# Schvartz (1977) intervention group (only, control is repeated)
mu_1 = 61.7
mu_2 = 53.8
mu_3 = 43.8
sd_1 = 2.3
sd_2 = 3.7
sd_3 = 3
k = 3*7

pooled_mu = (mu_1+mu_2+mu_3)/3
pooled_mu

pooled_sd = sqrt((sd_1^2+sd_2^2+sd_3^2)/k)
pooled_sd

combined_n = k
combined_n
