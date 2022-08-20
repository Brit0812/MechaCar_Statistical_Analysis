library(dplyr)
mechaCar_mpg <- read.csv('MechaCar_mpg.csv', stringsAsFactors = F)
lin_reg_model <- lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg)
summary(lin_reg_model)

suspension_Coil <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)
total_summary <- suspension_Coil%>% summarize(Mean= mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI), .groups= 'keep')
lot_summary <- suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean= mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI), .groups= 'keep')
t.test(suspension_Coil$PSI)
#huge difference when not including the mu
t.test(suspension_Coil$PSI, mu=1500)
t.test(subset(suspension_Coil$PSI, suspension_Coil$Manufacturing_Lot=="Lot1"), mu=1500)
t.test(subset(suspension_Coil$PSI, suspension_Coil$Manufacturing_Lot=="Lot2"), mu=1500)
t.test(subset(suspension_Coil$PSI, suspension_Coil$Manufacturing_Lot=="Lot3"), mu=1500)
