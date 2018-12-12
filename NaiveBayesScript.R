complete.dataset <- read.csv("tennis.csv")

# remove ID column from dataset
garbage <- ifelse(length(unique(complete.dataset[, 1])) == nrow(complete.dataset), 
                  complete.dataset <- complete.dataset[, -1], 0)
rm(garbage)
  
# 80% of the dataset size
train_size <- floor(0.8 * nrow(complete.dataset))

# set seed to make partition reproducible
set.seed(123)

# randomly select indexes to keep as training data
train.indexes <- sample(1:nrow(complete.dataset), size = train_size, replace = F)

# divide data into train and test
train.data <- complete.dataset[train.indexes,]
test.data <- complete.dataset[-train.indexes,]

# find and save target classes names and respective counts
target.classes.counts <- table(train.data[, ncol(train.data)])
target.classes <- names(target.classes.counts)

# finding probability for each target class
targetclass.probability <- target.classes.counts/nrow(train.data)

