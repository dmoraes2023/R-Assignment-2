---
title: "Assignment 2 R"
author: "Daniel Moraes"
date: "2024-03-06"
output: html_document
---
## R Assignment 2

The files created are organized in the folders: maize, teosinte and plots

## Part I: Data Inspection and Data Processing

# Load packages

```{r}
library(dbplyr)
library(plyr)
library(tidyverse)
library(ggplot2)
library(reshape2)
```

## Importing data
here is my snippet of code used for data importing:
#For fang_et_al_genotypes.txt file:

```{r}
## Importing data
#For fang_et_al_genotypes.txt file:
fang <- read_tsv("./fang_et_al_genotypes.txt")
view(fang)
```

## Data Inspection
here is my snippet of code used for data inspection:
```{r}
view(fang)
head(fang)
str(fang)
summary(fang)
dim(fang)
# Get information about the file
file_info <- file.info('fang_et_al_genotypes.txt')

# Extract the size of the file
file_size_fang <- file_info$size

# Print the size of the file
cat("Size of the file:", file_size_fang, "bytes\n")
```
#By inspecting this file (fang) I learned that:

- The number of lines is 2782, and the columns is 986
- The Size of the file: 11051939 bytes
- There are multiple commands to understand the data as str, view, summary

#For snp_position.txt file:
```{r}
snp <- read_tsv("./snp_position.txt")
view(snp)
```

## Data Inspection
here is my snippet of code used for data inspection:

```{r}
head(snp)
str(snp)
summary(snp)
dim(snp)
# Get information about the file
file_info <- file.info('snp_position.txt')

# Extract the size of the file
file_size_snp <- file_info$size

# Print the size of the file
cat("Size of the file:", file_size_snp, "bytes\n")
```
#By inspecting this file (snp) I learned that:

- The number of lines is 983, and the columns is 15
- The Size of the file: 82763 bytes
- There are multiple commands to understand the data as str, view, summary

## Data Processing
here is my snippet of code used for data processing:

# Organize and Sort the data

```{r}
snp_final <- select(snp, SNP_ID, Chromosome, Position) %>% 
  mutate(Position = as.numeric(Position))
snp_sort <- arrange(snp_final, Position)
maize <- filter(fang, Group %in% c("ZMMIL", "ZMMLR", "ZMMMR"))
teosinte<- filter(fang, Group %in% c("ZMPBA", "ZMPIL", "ZMPJA"))
```

# Organize and Transpose the data
```{r}
# Transposing the files
transpose_maize <- t(maize)
transpose_teosinte <- t(teosinte)
```

# Organize to the final data
```{r}
#Final data for maize and teosinte
maize_final<- data.frame(SNP_ID=rownames(transpose_maize), transpose_maize, row.names=NULL, check.names=FALSE)
teosinte_final <- data.frame(SNP_ID=rownames(transpose_teosinte), transpose_teosinte, row.names=NULL, check.names=FALSE) 
```

# Organize and Merge the data
```{r}
# Merging
maize_snp<- merge(snp_final, maize_final)
teosinte_snp <- merge(snp_final, teosinte_final)

# For sorting into chromosomes using a loop for maize
for(i in 1:10){
  data <- filter(maize_snp, Chromosome == i)
  write.csv(data, paste("maize_chr",i,".csv",sep=""),row.names=F)
}
# For sorting into chromosomes using a loop for teosinte 
for(i in 1:10){
  data <- filter(teosinte_snp, Chromosome == i)
  write.csv(data, paste("teosinte_chr",i,".csv",sep=""),row.names=F)
}
```

# Load the data from R repository-maize
```{r}
# Load the data from R repository
maize_chr1 <- read.csv("maize_chr1.csv")
maize_chr2 <- read.csv("maize_chr2.csv")
maize_chr3 <- read.csv("maize_chr3.csv")
maize_chr4 <- read.csv("maize_chr4.csv")
maize_chr5 <- read.csv("maize_chr5.csv")
maize_chr6 <- read.csv("maize_chr6.csv")
maize_chr7 <- read.csv("maize_chr7.csv")
maize_chr8 <- read.csv("maize_chr8.csv")
maize_chr9 <- read.csv("maize_chr9.csv")
maize_chr10 <- read.csv("maize_chr10.csv")
```

# Load the data from R repository-teosinte
```{r}
# Load the data from R repository
teosinte_chr1 <- read.csv("teosinte_chr1.csv")
teosinte_chr2 <- read.csv("teosinte_chr2.csv")
teosinte_chr3 <- read.csv("teosinte_chr3.csv")
teosinte_chr4 <- read.csv("teosinte_chr4.csv")
teosinte_chr5 <- read.csv("teosinte_chr5.csv")
teosinte_chr6 <- read.csv("teosinte_chr6.csv")
teosinte_chr7 <- read.csv("teosinte_chr7.csv")
teosinte_chr8 <- read.csv("teosinte_chr8.csv") 
teosinte_chr9 <- read.csv("teosinte_chr9.csv")
teosinte_chr10 <- read.csv("teosinte_chr10.csv")
```

# Increasing files- maize
```{r}
# Maize- 1 to 10
data <- arrange(maize_chr1, Position) 
write.csv(data, paste("maize_inc_1",".csv",sep=""),row.names=F)
data <- arrange(maize_chr2, Position) 
write.csv(data, paste("maize_inc_2",".csv",sep=""),row.names=F)
data <- arrange(maize_chr3, Position) 
write.csv(data, paste("maize_inc_3",".csv",sep=""),row.names=F)
data <- arrange(maize_chr4, Position) 
write.csv(data, paste("maize_inc_4",".csv",sep=""),row.names=F)
data <- arrange(maize_chr5, Position) 
write.csv(data, paste("maize_inc_5",".csv",sep=""),row.names=F)
data <- arrange(maize_chr6, Position) 
write.csv(data, paste("maize_inc_6",".csv",sep=""),row.names=F)
data <- arrange(maize_chr7, Position) 
write.csv(data, paste("maize_inc_7",".csv",sep=""),row.names=F)
data <- arrange(maize_chr8, Position) 
write.csv(data, paste("maize_inc_8",".csv",sep=""),row.names=F)
data <- arrange(maize_chr9, Position) 
write.csv(data, paste("maize_inc_9",".csv",sep=""),row.names=F)
data <- arrange(maize_chr10, Position) 
write.csv(data, paste("maize_inc_10",".csv",sep=""),row.names=F)
```

# Decreasing files- maize
```{r}
# Maize- 1 to 10 
data <- arrange(maize_chr1, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_1",".csv",sep=""),row.names=F)

data <- arrange(maize_chr2, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_2",".csv",sep=""),row.names=F)

data <- arrange(maize_chr3, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_3",".csv",sep=""),row.names=F)

data <- arrange(maize_chr4, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_4",".csv",sep=""),row.names=F)

data <- arrange(maize_chr5, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_5",".csv",sep=""),row.names=F)

data <- arrange(maize_chr6, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_6",".csv",sep=""),row.names=F)

data <- arrange(maize_chr7, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_7",".csv",sep=""),row.names=F)

data <- arrange(maize_chr8, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_8",".csv",sep=""),row.names=F)

data <- arrange(maize_chr9, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_9",".csv",sep=""),row.names=F)

data <- arrange(maize_chr10, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("maize_dec_10",".csv",sep=""),row.names=F)
```

# Organizing the increasing and decreasing files in a folder called maize
```{r}
# Create the maize folder
if (!file.exists("maize")) {
  dir.create("maize")
}

# Move the files into the maize folder
for (i in 1:10) {
  file.rename(paste0("maize_inc_", i, ".csv"), paste0("maize/maize_inc_", i, ".csv"))
  file.rename(paste0("maize_dec_", i, ".csv"), paste0("maize/maize_dec_", i, ".csv"))
}
```

# Increasing files- teosinte
```{r}
# Teosinte- 1 to 10
data <- arrange(teosinte_chr1, Position) 
write.csv(data, paste("teosinte_inc_1",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr2, Position) 
write.csv(data, paste("teosinte_inc_2",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr3, Position) 
write.csv(data, paste("teosinte_inc_3",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr4, Position) 
write.csv(data, paste("teosinte_inc_4",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr5, Position) 
write.csv(data, paste("teosinte_inc_5",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr6, Position) 
write.csv(data, paste("teosinte_inc_6",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr7, Position) 
write.csv(data, paste("teosinte_inc_7",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr8, Position) 
write.csv(data, paste("teosinte_inc_8",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr9, Position) 
write.csv(data, paste("teosinte_inc_9",".csv",sep=""),row.names=F)
data <- arrange(teosinte_chr10, Position) 
write.csv(data, paste("teosinte_inc_10",".csv",sep=""),row.names=F)
```

# Decreasing files- teosinte
```{r}
# Teosinte- 1 to 10
data <- arrange(teosinte_chr1, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_1",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr2, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_2",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr3, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_3",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr4, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_4",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr5, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_5",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr6, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_6",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr7, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_7",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr8, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_8",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr9, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_9",".csv",sep=""),row.names=F)

data <- arrange(teosinte_chr10, desc(Position)) 
data1 <- data.frame(sapply(data,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(data1, paste("teosinte_dec_10",".csv",sep=""),row.names=F)

```

# Organizing the increasing and decreasing files in a folder called teosinte
```{r}
# Create the teosinte folder
if (!file.exists("teosinte")) {
  dir.create("teosinte")
}

# Move the files into the teosinte folder
for (i in 1:10) {
  file.rename(paste0("teosinte_inc_", i, ".csv"), paste0("teosinte/teosinte_inc_", i, ".csv"))
  file.rename(paste0("teosinte_dec_", i, ".csv"), paste0("teosinte/teosinte_dec_", i, ".csv"))
}
```


# Organizing the Other files that were used for Part I in a folder called Other

```{r}
# Create the "Other" folder if it doesn't exist
if (!file.exists("Other")) {
  dir.create("Other")
}

# Move the files into the "Other" folder
for (i in 1:10) {
  file.rename(paste0("maize_chr", i, ".csv"), paste0("Other/maize_chr", i, ".csv"))
  file.rename(paste0("teosinte_chr", i, ".csv"), paste0("Other/teosinte_chr", i, ".csv"))
}
```

## Part II Visualization

# Data organization 
```{r}

# Transposing the fang file 
t(fang) -> t_fang

# Organizing 
fang_final <- data.frame(SNP_ID=rownames(t_fang), t_fang, row.names=NULL, check.names=FALSE)

# Merging fang with snp
fang_snp<- merge( snp_final, fang_final, by="SNP_ID", all=TRUE)

```
# Visualization: SNPs per chromosome
```{r}
fang_snp$Chromosome <- factor(fang_snp$Chromosome, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "unknown", "multiple", "NA"))
Graph_total<- ggplot(fang_snp,aes(x = Chromosome, fill=Chromosome)) + geom_bar(position ="stack")+
  ggtitle(" Total SNPs per Chromosome")
Graph_total
ggsave("Graph_total.tiff", plot = Graph_total, device = "tiff", width = 8, height = 6, units = "in")

maize_snp$Chromosome <- factor(maize_snp$Chromosome, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "unknown", "multiple", "NA"))
Graph_maize<- ggplot(maize_snp,aes(x = Chromosome, fill=Chromosome)) + geom_bar(position ="stack")+
  ggtitle("Maize SNPs per Chromosome")
Graph_maize
ggsave("Graph_maize.tiff", plot = Graph_maize, device = "tiff", width = 8, height = 6, units = "in")
teosinte_snp$Chromosome <- factor(teosinte_snp$Chromosome, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "unknown", "multiple", "NA"))
Graph_teosinte<- ggplot(teosinte_snp,aes(x = Chromosome, fill=Chromosome)) + geom_bar(position ="stack")+
  ggtitle("Teosinte SNPs per Chromosome")
Graph_teosinte
ggsave("Graph_teosinte.tiff", plot = Graph_teosinte, device = "tiff", width = 8, height = 6, units = "in")

```

# Data organization- part 2
```{r}
# Creating the groups
fang_new <- fang %>%
  mutate_if(is.character, str_replace_all, pattern = "A/A", replacement = "Homozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "T/T", replacement = "Homozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "G/G", replacement = "Homozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "C/C", replacement = "Homozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "A/T", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "A/G", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "A/C", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "T/A", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "T/G", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "T/C", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "G/A", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "G/T", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "G/C", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "C/A", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "C/T", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "C/G", replacement = "Heterozygous") %>%
  mutate_if(is.character, str_replace_all, pattern = "\\?\\/?", replacement = "Missing")

```

# Final Data visualization- Plotting the proportion heterozygous and homozygous
```{r}
#Subsetting SNP columns
data <- colnames(fang_new)[-c(1:3)]
data1 <- gather(fang_new, SNP, Genotype, data)

# Plotting the proportion heterozygous and homozygous SNPs with missing data
Proportion <- ggplot(data = data1, aes(x = Sample_ID, fill = Genotype)) + 
  geom_bar(position = "fill") +
  labs(x = "Sample ID", y = "Proportion") +
  theme(axis.text.x = element_blank())+
  ggtitle("Proportion heterozygous and homozygous SNPs with missing data")
Proportion
ggsave("Proportion.tiff", plot = Proportion, device = "tiff", width = 8, height = 6, units = "in")

# Plotting the proportion heterozygous and homozygous SNPs with missing data by Groups
Proportion_group <- ggplot(data = data1, aes(x = Group, fill = Genotype)) + 
  geom_bar(position = "fill") +
  labs(x = "Group", y = "Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels by 45 degrees
  ggtitle("Proportion heterozygous and homozygous by Group")
Proportion_group
ggsave("Proportion_group.tiff", plot = Proportion_group, device = "tiff", width = 8, height = 6, units = "in")
```
# My Own Graph: Distribution of SNP by group
```{r}
# Plot: Distribution of SNP 
Distribution_SNP<- ggplot(data = data1, aes(x = Group)) +
  geom_density(aes(fill = Genotype), alpha = 0.5) +
  facet_wrap(~ Genotype)+
  ggtitle(" Distribution of SNP by Group")
Distribution_SNP
ggsave("Distribution_SNP.tiff", plot = Distribution_SNP, device = "tiff", width = 8, height = 6, units = "in")
```

# Oganize the plots in a folder called plots
```{r}
# Create a folder named "plots" if it doesn't exist
if (!file.exists("plots")) {
  dir.create("plots")
}

# List of files to be moved
files_to_move <- c("Graph_total.tiff","Graph_maize.tiff","Graph_teosinte.tiff","Proportion.tiff","Proportion_group.tiff","Distribution_SNP.tiff" )

# Move each file to the "plots" folder
for (file in files_to_move) {
  file.rename(file, paste0("plots/", file))
}
```
