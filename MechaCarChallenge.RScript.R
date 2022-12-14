library(jsonlite)
library(dplyr)

##Deliverable 1
dataframe <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=dataframe) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=dataframe))

##Deliverable 2
suspension_coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- suspension_coil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary <- suspension_coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

##Deliverable 3
t.test(suspension_coil_table$PSI,mu = 1500)

t.test(subset(suspension_coil_table,Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(suspension_coil_table,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(suspension_coil_table,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
       