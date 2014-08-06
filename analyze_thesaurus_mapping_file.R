# Jonas Dupuich
# 8/6/14
# Analyze PLOS Thesaurus mapping file

# Note: modifications to mapping file required for script to work:
# remove first two columns (these refer to the previous version of thesaurus
# add header row with column names "code" and "subject_areas"
# save as mapping_file.csv

# set working directory
setwd("/Users/jonasd/Dropbox/analysis/")

# read file
raw_mapping_data <- read.csv("mapping_file.csv")

# total rows in mapping file
length(raw_mapping_data$code)

# total paths
length(unique(raw_mapping_data$code))

# total subject areas
length(unique(raw_mapping_data$subject_area))

# get unique rows
unique_paths <- unique(raw_mapping_data)

# write file with unique rows
write.table(unique_paths, file = "mapping_file_unique_rows.csv", sep = ",")

# make table to count frequency of repeated paths
n_occur <- data.frame(table(unique_paths$subject_area))

# write file with unique rows
write.table(n_occur, file = "n_occur.csv", sep = ",")

# make table to count path occurance frequency
occur_freq <- data.frame(table(n_occur$Freq))

# write file with path occurance frequency
write.table(occur_freq, file = "occur_freq.csv", sep = ",")
