## Assign test data to testData and train data to trainData

testData <- read.table("./test/X_test.txt")
trainData <- read.table("./train/X_train.txt")

## Extract mean and std dev columns  

meanStdData <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254)

testData <- testData[, meanStdData] 
trainData <- trainData[, meanStdData] 

## merge testData and trainData in mergedData

mergedData <- merge(testData, trainData, all=TRUE)

## Label data using features.txt

labelNames <- read.table("features.txt")
labelNames <- labelNames[meanStdData, 2]
names(mergedData) <- labelNames

## getting averages of each variable

TidyData <- sapply(mergedData, median)

## exporting TidyData

write.table(TidyData, "TidyData.txt") 




