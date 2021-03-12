library(ggplot2)
library(ggridges)
library(tidyverse)
setwd("R")
file.sources = list.files(pattern="*.R")
sapply(file.sources,source,.GlobalEnv)
setwd("../runs")


.MODELDIR = c("model0/","model1/")
.THEME    = theme_bw(base_size = 12, base_family = "")
.OVERLAY  = TRUE
.FIGS     = c("figs/")

EJECUTA = "MTT0920"
fn       <- paste0(.MODELDIR, EJECUTA)
M        <- lapply(fn, read_admb)
names(M) <- c("base","test")

plot_desove(M[1:2],error="F")
plot_desove(M,error="F")
source("../R/plot-F.R")
source("../R/plot-size-comps.R")
plot_size_comps(M,Model=1,f=2)
plot_size_comps(M,Model=1,f=3)
source("../R/plot-crucero.R")
plot_crucero(M[1:2])
plot_crucero(M[[1]])
plot_F(M[1:2])
plot_F(M[1:3],error="F")

# Names of variables for output
#"RCH_obs"           "RCH_pre"          
##  [7] "cv_RCH"            "RPE_obs"           "RPE_pre"          
# [10] "cv_RPE"            "MPH_obs"           "MPH_pre"          
# [13] "cv_MPH"            "Desem_Chi_obs"     "Desem_Chi_pre"    
A$MPH_obs
A$MPH_pre
A$RPE_obs
A$RPE_pre
A$Reclu_obs
A$Desem_Chi_obs
# [16] "cv_Desemb_ch"      "Desem_Per_obs"     "Desem_Per_pre"    
# [19] "cv_Desemb_pe"      "Ctot_Chi_pre"      "Ctot_Per_pre"     
# [22] "Lmed_Chi_obs"      "Lmed_Chi_pre"      "Lmed_Per_obs"     
# [25] "Lmed_Per_pre"      "Lmed_Cru_obs"      "Lmed_Cru_pre"     
# [28] "Biom_deso"         "Biom_cero"         "Biom_total"       
# [31] "SSBo"              "PHI"               "Reclu_obs"        
# [34] "Reclu_dev"         "Opcion_Reclu"      "RPR_dina"         
# [37] "RPR_long"          "F_Chile"           "F_Peru"           
# [40] "F_Total"           "F_fin"             "Selec_flo_Chi"    
# [43] "Selec_flo_Per"     "Selec_cru"         "Edades"           
# [46] "F_ch"              "F_pe"              "Pro_flo_chi_obs"  
# [49] "Pro_flo_chi_pre"   "sz_pro_flo_chi"    "Pro_flo_per_obs"  
# [52] "Pro_flo_per_pre"   "sz_pro_flo_per"    "Pro_cru_obs"      
# [55] "Pro_cru_pre"       "Edad_Ctot_ch"      "Edad_Ctot_pe"     
# [58] "sz_pro_cru_obs"    "Tallas"            "Sobre"            
# [61] "N"                 "Neq"               "No"               
# [64] "log_like"          "log_prior"         "Prob_talla"       
# [67] "Mu_edad"           "Sigma_edad"        "Linf"             
# [70] "k"                 "Lo"                "alfa"             
# [73] "beta"              "M"                 "h"                
# [76] "Madu_talla"        "CTP_seme"          "Proy_bt_seme"     
# [79] "Proy_bd_seme"      "Proy_bd_virg"      "Fproy"            
# [82] "RPR_proy"          "Madu_edad"         "Peso_medio_edad"  
# [85] "Acus_cv"           "RCH_cv"            "RPE_cv"           
# [88] "MPH_cv"            "Tama_post_flo_Chi" "Tama_post_flo_Per"
# [91] "Tama_post_Cru"     "alfa_edad"         "beta_edad"        
# [94] "post_A50fch"       "post_A50fpe"       "post_A50cru"      
# [97] "PBR"               "time_sim"          "RMSsem1"          
#[100] "Y1sem1"            "Npsin"             "Npcon"            
#[103] "Np"                "prior_log_F"       "fsal1"            
#[106] "fsal2"             "fit"               "run_name"         
#[109] "post.samp"        
##