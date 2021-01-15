#Menentukan lokasi work directory
setwd("D:/UTS_3311901074")
#memilih dataset
dataset <- read.csv("Cryotherapy.csv", sep = ",")
#install paket yang diperlukan
install.packages("C50")
install.packages("printr")
#memasang library
library(C50)
library(printr)
#menentukan model dengan result_of_treatment sebagai factor nya
model <- C5.0(as.factor(Result_of_Treatment) ~., data=dataset)
#memunculkan ringkasan/rangkuman dari model
summary(model)
#menampilkan model
model
#menampilkan plot berupa pohon keputusan
plot(model)
#Menjadikan dataset, sebagai data testing.
#Namun hanya kolom 1-6 saja, dan tanpa label
datatesting <- dataset[,1:6]
#melakukan prediksi dengan 
predictions <- predict(model, datatesting)
#membandingkan hasil prediksi dengan dataset.
table(predictions, dataset$Result_of_Treatment)
