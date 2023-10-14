# Load required libraries
library(class)

# Step 1: Load the Iris Dataset
data(iris)
View(iris)

# Step 2: Preprocess the Data
# Encode species labels
iris$Species <- as.factor(iris$Species)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
sample_indices <- sample(1:nrow(iris), 0.7 * nrow(iris))  # 70% for training
train_data <- iris[sample_indices, ]
test_data <- iris[-sample_indices, ]

# Step 3: Train the KNN Model
# Set the number of neighbors (k)
k <- 3  # You can change this value
knn_model <- knn(train = train_data[, -5], test = test_data[, -5], cl = train_data$Species, k = k)

# Step 4: Evaluate the KNN Model
# Calculate accuracy
accuracy <- mean(knn_model == test_data$Species)
cat("Accuracy:", accuracy, "\n")

# Create a confusion matrix
confusion_matrix <- table(Predicted = knn_model, Actual = test_data$Species)
cat("Confusion Matrix:\n", confusion_matrix, "\n")

# Step 5: Make Predictions (Optional)
# You can make predictions on new data using the trained model
new_data <- data.frame(Sepal.Length = c(5.1, 6.2, 4.8),
                       Sepal.Width = c(3.5, 2.9, 3.0),
                       Petal.Length = c(1.4, 4.3, 1.4),
                       Petal.Width = c(0.2, 1.3, 0.2))
predictions <- knn(train_data[, -5], new_data, cl = train_data$Species, k = k)
cat("Predictions:\n", predictions, "\n")
