library(tidyverse)
install.packages("readxl")
library(readxl)
library(lubridate)
my_data <- read_excel("ANZ synthesised transaction dataset.xlsx")
View(my_data)
install.packages("factoextra")


summary(my_data$age)
summary(my_data$balance)
summary(my_data$date)

summary(my_data$amount)

library(plotly)
my_data_location <- my_data %>%
  separate(merchant_long_lat, c("merchant_long_lat_1", "merchant_long_lat_2"), sep = " ")
my_data_location %>%
  plot_geo() %>%
  add_trace(x = ~merchant_long_lat_1,
            y = ~merchant_long_lat_2)
