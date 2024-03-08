---
  title: "Assignment 2 R"
author: "Daniel Moraes"
date: "2024-03-06"
output: html_document
---
  
## R Assignment 2
  
## Part I: Data Inspection and Data Processing
  
# Load packages
  
library(dbplyr)
library(plyr)
library(tidyverse)
library(ggplot2)
library(reshape2)

## Importing data
# Here is my snippet of code used for data importing:
  #For fang_et_al_genotypes.txt file:
  
 #
## Importing data
#For fang_et_al_genotypes.txt file:
fang <- read_tsv("./fang_et_al_genotypes.txt")
print(fang)

## Data Inspection
# Here is my snippet of code used for data inspection:


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


#For snp_position.txt file:
```{r}
snp <- read_tsv("./snp_position.txt")
print(snp)

## Data Inspection
here is my snippet of code used for data inspection:
  
 #
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

## Data Processing
#here is my snippet of code used for data processing:
  
  # Organize and Sort the data
  
 #
snp_final <- select(snp, SNP_ID, Chromosome, Position)
snp_sort <- arrange(snp_final, Position)
maize <- filter(fang, Group %in% c("ZMMIL", "ZMMLR", "ZMMMR"))
teosinte<- filter(fang, Group %in% c("ZMPBA", "ZMPIL", "ZMPJA"))

# Organize and Transpose the data

# Transposing the files
transpose_maize <- t(maize)
transpose_teosinte <- t(teosinte)
# Final data for maize and teosinte

snp_final <- select(snp, SNP_ID, Chromosome, Position)
snp_sort <- arrange(snp_final, Position)
maize <- filter(fang_et_al, Group %in% c("ZMMIL", "ZMMLR", "ZMMMR"))
teosinte<- filter(fang_et_al, Group %in% c("ZMPBA", "ZMPIL", "ZMPJA"))


# Organize and Transpose the data

#Rename the first column in SNP file to merge 
rename(snp_sort, Sample_ID = SNP_ID) -> snp_f
#Transposing the files
transpose_maize <- t(maize)
transpose_teosinte <- t(teosinte)
#Final data for maize and teosinte
maize_final<- data.frame(SNP_ID=rownames(transpose_maize), transpose_maize, row.names=NULL, check.names=FALSE)
teosinte_final <- data.frame(SNP_ID=rownames(transpose_teosinte), transpose_teosinte, row.names=NULL, check.names=FALSE) 

# Organize and Merge the data

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

# Load the data from R repository-maize

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

# Load the data from R repository-teosinte

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

# Increasing files- maize

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

# Decreasing files- maize

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

# Organizing the increasing and decreasing files in a folder called maize

# Create the maize folder
if (!file.exists("maize")) {
  dir.create("maize")
}

# Move the files into the maize folder
for (i in 1:10) {
  file.rename(paste0("maize_inc_", i, ".csv"), paste0("maize/maize_inc_", i, ".csv"))
  file.rename(paste0("maize_dec_", i, ".csv"), paste0("maize/maize_dec_", i, ".csv"))
}

# Increasing files- teosinte

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


# Decreasing files- teosinte

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

# Organizing the increasing and decreasing files in a folder called teosinte

# Create the teosinte folder
if (!file.exists("teosinte")) {
  dir.create("teosinte")
}

# Move the files into the teosinte folder
for (i in 1:10) {
  file.rename(paste0("teosinte_inc_", i, ".csv"), paste0("teosinte/teosinte_inc_", i, ".csv"))
  file.rename(paste0("teosinte_dec_", i, ".csv"), paste0("teosinte/teosinte_dec_", i, ".csv"))
}



# Organizing the Other files that were used for Part I in a folder called Other

# Create the "Other" folder if it doesn't exist
if (!file.exists("Other")) {
  dir.create("Other")
}

# Move the files into the "Other" folder
for (i in 1:10) {
  file.rename(paste0("maize_chr", i, ".csv"), paste0("Other/maize_chr", i, ".csv"))
  file.rename(paste0("teosinte_chr", i, ".csv"), paste0("Other/teosinte_chr", i, ".csv"))
}

## Part II Visualization

# Data organization 

# Transposing the fang file 
t(fang) -> t_fang

# Organizing 
fang_final <- data.frame(SNP_ID=rownames(t_fang), t_fang, row.names=NULL, check.names=FALSE)

# Merging
fang_snp<- merge( snp_final, fang_final, by="SNP_ID", all=TRUE)

# Visualize group distribution
ggplot(fang, aes(Group)) + geom_bar()


# Data organization- part 2

# Melting
headers_names <- colnames(fang)[-c(1:3)]
fang_melt <- melt(fang, measure.vars = headers_names)

# Creating subsets
homozygous <- (fang_melt$value=="A/A" | fang_melt$value=="C/C" | fang_melt$value=="G/G" | fang_melt$value=="T/T" )
#counting heterozygous
hetero <- (fang_melt$value!="A/A" | fang_melt$value!="C/C" | fang_melt$value!= "G/G" | fang_melt$value!= "T/T" )
missing <- (fang_melt$value=="?/?")

# Sorting
fang_ID_sort<- arrange(fang_melt, Sample_ID)

# Sorting
fang_group_sort <- arrange(fang_melt, Group) 

# Counting
count_ID <- ddply(fang_ID_sort, c("Sample_ID"), summarise, count_homozygous=sum(homozygous, na.rm=TRUE), count_heterozygous=sum(!homozygous, na.rm=TRUE), isNA=sum(is.na(homozygous)))

# Melting 
count_ID_melt <- melt(count_ID, measure.vars = c("count_homozygous", "count_heterozygous", "isNA"))

# Plotting 
Plot_counting_SampleID <- ggplot(count_ID_melt,aes(x = Sample_ID, y= value, fill=variable)) + geom_bar(stat = "identity", position ="stack")
Plot_counting_SampleID

# Plotting for a grouped data
count_group <- ddply(fang_group_sort, c("Sample_ID"), summarise, count_homozygous=sum(homozygous, na.rm=TRUE), count_heterozygous=sum(!homozygous, na.rm=TRUE), isNA=sum(is.na(homozygous)))

count_group_melt <- melt(count_ID, measure.vars = c("count_homozygous", "count_heterozygous", "isNA"))
```

# Final Data visualization

# Plot: Graph
Graph<- ggplot(count_group_melt,aes(x = Sample_ID, y= value, fill=variable)) + geom_bar(stat = "identity", position ="stack")

ggsave("Graph.tiff", plot = Graph, device = "tiff", width = 8, height = 6, units = "in")

# Calculate proportions
count_ID_melt <- count_ID_melt %>%
  group_by(Sample_ID) %>%
  mutate(total = sum(value),
         proportion = value / total)

# Now, plot the stacked bar chart with proportions
Graph_proportion <- ggplot(count_ID_melt, aes(x = Sample_ID, y = proportion, fill = variable)) + 
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(y = "Proportion", fill = "Category") 

ggsave("Graph_proportion.tiff", plot = Graph_proportion, device = "tiff", width = 8, height = 6, units = "in")

# Plot: SNP grouped by chromosome
Snp_chromosome <- ggplot(fang_snp, aes (Chromosome, SNP_ID)) + geom_point(color = 'blue', size = 2) + theme(axis.text.y = element_blank())

ggsave("Snp_chromosome.tiff", plot = Snp_chromosome, device = "tiff", width = 8, height = 6, units = "in")

#Plot: Position and SNP
Snp_position <- ggplot(fang_snp, aes (SNP_ID, Position)) + geom_point(color = 'red', size = 2) + theme(axis.text.y = element_blank())

ggsave("Snp_position.tiff", plot = Snp_position, device = "tiff", width = 8, height = 6, units = "in")

#Plot: Chromosomal distribution of the SNPs
Chromosome_distribution <- ggplot(fang_snp, aes (Position, Chromosome)) + geom_point(color = 'green4', size = 2) + theme(axis.text.x = element_blank())

ggsave("Chromosome_distribution.tiff", plot = Chromosome_distribution, device = "tiff", width = 8, height = 6, units = "in")

# Plot: Density of SNP positions
Density_plot <- ggplot(fang_snp, aes(x = Position)) +
  geom_density(fill = 'skyblue', color = 'blue') +
  labs(x = "Position", y = "Density", title = "Density of SNP Positions") +
  theme_minimal()

ggsave("Density_plot.tiff", plot = Density_plot, device = "tiff", width = 8, height = 6, units = "in")


# Oganize the plots in a folder called plots

# Create a folder named "plots" if it doesn't exist
if (!file.exists("plots")) {
  dir.create("plots")
}

# List of files to be moved
files_to_move <- c("Graph.tiff","Graph_proportion.tiff", "Snp_chromosome.tiff", "Snp_position.tiff", "Chromosome_distribution.tiff", "Density_plot.tiff")

# Move each file to the "plots" folder
for (file in files_to_move) {
  file.rename(file, paste0("plots/", file))
}

