philips, akzo, van houten and unilever
refine$company <- gsub(".*uni.*","unilever",refine$company,ignore.case=TRUE)
refine$company <- gsub(".*ak.*","akzo",refine$company,ignore.case=TRUE)
refine$company <- gsub(".*van.*","van houten",refine$company,ignore.case=TRUE)
refine$company <- gsub(".*ps.*","phlips",refine$company,ignore.case=TRUE)

Separate product code and number
library(dplyr)
library(tidyr)
colnames(refine)[2]<- "product"
separate(refine,product,c("product_code", "product_number"), '-')

refine$product_code <- gsub("p","Smartphone",refine$product_code)
refine$product_code <- gsub("v","TV",refine$product_code)
refine$product_code <- gsub("x","Laptop",refine$product_code)
refine$product_code <- gsub("q","Tablet",refine$product_code)

refine$full_address <- paste(refine$address,refine$city,re#fine$country, sep=",")
library(dummies)
refine <- cbind(refine,dummy(refine$company,sep = "_"))
names(refine) <- gsub(x = names(refine), pattern = "refine", replacement = "company")

refine <- cbind(refine,dummy(refine$product_code,sep = "_"))
names(refine) <- gsub(x = names(refine), pattern = "refine", replacement = "product")


