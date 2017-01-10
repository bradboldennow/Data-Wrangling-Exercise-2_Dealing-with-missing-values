# Replace embarked missing values
titanic3$embarked[is.na(titanic3$embarked)] = "S"

# Replace missing age values
titanic3$age[is.na(titanic3$age)] = mean(titanic3$age, na.rm = TRUE)

# Fill in missing lifeboat values with 'NA'
titanic3$boat[is.na(titanic3$boat)] = 'NA'

# Provide a new column indicating if someone survived based on cabin number
library(dplyr)
titanic3 = titanic3 %>% mutate(has_cabin_number = ifelse(is.na(titanic3$cabin), 1, 0))

titanic_clean = titanic3

write.csv(titanic_clean, file = 'titanic_clean.csv')