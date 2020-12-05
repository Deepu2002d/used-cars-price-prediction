install.packages('openxlsx')
library(openxlsx)
read.xlsx("C:/Users/hp/Desktop/deeepu/R/Data_Train.xlsx") -> df  #change directory according to your file location
View(df)

#checking number of rows and columns
nrow(df)
ncol(df)

#categorical columns tabulation
table(df$Location)
table(df$Year)
table(df$Fuel_Type)
table(df$Transmission)
table(df$Owner_Type)
table(df$Seats)

#min-max values
min(df$Kilometers_Driven)
max(df$Kilometers_Driven)
min(df$Year)
max(df$Year)

#convert mileage, engine, power into complete numeric and than find min max

#find null values
is.na(df$Location)
sum(is.na(df$Name))
sum(is.na(df$Location))
sum(is.na(df$Year))
sum(is.na(df$Kilometers_Driven))
sum(is.na(df$Fuel_Type))
sum(is.na(df$Transmission))
sum(is.na(df$Owner_Type))
sum(is.na(df$Mileage)) #2 null value presents
sum(is.na(df$Engine))  #36 NaN presents
sum(is.na(df$Power))   #42 NaN present
sum(is.na(df$Seats))
sum(is.na(df$Price))

#
colnames(df)[colnames(df) == 'Seats'] <- "Seas_No"  #column name changed

#elt's filter some things
library(dplyr)
df %>% filter(Fuel_Type=="CNG") -> Fuel_CNG #it'll show only CNG fuel type col
min(Fuel_CNG$Year) #oldest car in CNG fuel_type is from 2005
max(Fuel_CNG$Year) #latest car in CNG fuel_type is from 2019
table(Fuel_CNG$Owner_Type) #first owners are maximum i.e 45

df %>% filter(Fuel_Type=="Petrol") -> Fuel_Petrol
min(Fuel_Petrol$Year) #oldest car of Petrol type is from 1998
max(Fuel_Petrol$Year)  #latest Petroltype car is from 2019
table(Fuel_Petrol$Owner_Type) #first owners are max. but a few fourth owner are present for petrol cars

df %>% filter(Fuel_Type=="Diesel") -> Fuel_Diesel
min(Fuel_Diesel$Year) #oldest Diesel car is from 1998
max(Fuel_Diesel$Year) #latest Diesel car is from 2019
table(Fuel_Diesel$Owner_Type) #first owners are maximum
# we can also notice from output that Diesel fuel type have maximum owners

#we can filter and see  results for other columns also

mean(df$Kilometers_Driven) #it's 58738.38
mean(df$Price) #mean price is 9.479468
#find mean for Mileaage, Engine & Power also by converting them into numeric

#now, let's visualize some data
install.packages("ggplot2")
library(ggplot2)
ggplot(data=df, aes(x=Year)) + geom_histogram()
ggplot(data=Fuel_Diesel, aes(x=Year)) + geom_histogram() 
ggplot(data=Fuel_Petrol, aes(x=Year)) + geom_histogram()
ggplot(data=Fuel_CNG, aes(x=Year)) + geom_histogram()

ggplot(data=Fuel_Petrol, aes(x=Seats_No)) + geom_bar()
ggplot(data=Fuel_CNG, aes(x=Seats_No)) + geom_bar()
ggplot(data=Fuel_Diesel, aes(x=Seats_No)) + geom_bar()

ggplot(data=df, aes(x=Location)) + geom_bar(fill='orange') #we can see Mumbai have max cars and Ahmedabad have least
ggplot(data=Fuel_Diesel, aes(x=Location, fill=as.factor(Location))) + geom_bar() #Hyderabad have maximum while Ahmedabad have least
ggplot(data=Fuel_CNG, aes(x=Location, fill=as.factor(Location))) + geom_bar() #Mumbai have max and Chennai have least
ggplot(data=Fuel_Petrol, aes(x=Location, fill=as.factor(Location))) + geom_bar()
ggplot(data=df, aes(x=Transmission)) + geom_bar(fill='orange') #Manual cars are more in comparison to automatic


#let's check on mileage
ggplot(data=Fuel_CNG, aes(x=Mileage, fill=as.factor(Mileage))) + geom_bar()
ggplot(data=Fuel_Petrol, aes(x=Mileage, fill=as.factor(Mileage))) + geom_bar()
ggplot(data=Fuel_Diesel, aes(x=Mileage, fill=as.factor(Mileage))) + geom_bar()

#we can do similar operations on other columns also 
 
#scatter plots
ggplot(data=Fuel_Diesel, aes(x=Year, y=Price)) + geom_point(col='blue') #points before 2000 can be considered as outliers
ggplot(data=Fuel_Diesel, aes(x=Seats, y=Price)) + geom_point(col='blue')
ggplot(data=Fuel_Diesel, aes(x=Kilometers_Driven, y=Price)) + geom_point(col='blue')

ggplot(data=Fuel_Petrol, aes(x=Year, y=Price)) + geom_point(col='blue')
ggplot(data=Fuel_Petrol, aes(x=Seats, y=Price)) + geom_point(col='blue')
ggplot(data=Fuel_Petrol, aes(x=Kilometers_Driven, y=Price)) + geom_point(col='blue')

ggplot(data=Fuel_cNG, aes(x=Year, y=Price)) + geom_point(col='blue')
ggplot(data=Fuel_cNG, aes(x=Seats, y=Price)) + geom_point(col='blue')
ggplot(data=Fuel_cNG, aes(x=Kilometers_Driven, y=Price)) + geom_point(col='blue')

ggplot(data=Fuel_cNG, aes(x=as.factor(Year), y=Price)) + geom_boxplot()