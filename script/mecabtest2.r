#install.packages("RMeCab", repos = "http://rmecab.jp/R")


###ライブラリーの読み込み#####
library("XLConnect")
library("tcltk")
library("RMeCab")
library("wordcloud")
library("RColorBrewer")

#train_data読み込み
x <- read.table("data/train.tsv", sep="\t", skip=0, header=T, stringsAsFactors=F, fileEncoding="UTF-8")

#before書き出し
write.table(x$before, "tmp/shift_before.txt", quote=F, 
            col.names=F, append=T)
#after書き出し
write.table(x$after, "tmp/shift_after.txt", quote=F, 
            col.names=F, append=T)


before_train <- RMeCabFreq("tmp/shift_before.txt")
after_train <- RMeCabFreq("tmp/shift_after.txt")





train_data <- subset(train_data,Info1 == "名詞")
unlist(train_data)

type <- c("数","非自立","接尾")
train_data <- subset(train_data, !Info2 %in% type)

#データの並び替え頻度順
train_freq <- train_data[order(train_data$Freq,decreasing = T),]
write.table(train_freq, "tmp/train_freq.txt", quote=F, 
            col.names=F, append=T)

#ワードクラウド表示する
patarn <- brewer.pal(3,"Dark2")
wordcloud(train_freq$Term, train_freq$Freq, min.freq = 1)

