#install.packages("RMeCab", repos = "http://rmecab.jp/R")


###���C�u�����[�̓ǂݍ���#####
library("XLConnect")
library("tcltk")
library("RMeCab")
library("wordcloud")
library("RColorBrewer")

#train_data�ǂݍ���
x <- read.table("data/train.tsv", sep="\t", skip=0, header=T, stringsAsFactors=F, fileEncoding="UTF-8")

#before�����o��
write.table(x$before, "tmp/shift_before.txt", quote=F, 
            col.names=F, append=T)
#after�����o��
write.table(x$after, "tmp/shift_after.txt", quote=F, 
            col.names=F, append=T)


before_train <- RMeCabFreq("tmp/shift_before.txt")
after_train <- RMeCabFreq("tmp/shift_after.txt")





train_data <- subset(train_data,Info1 == "����")
unlist(train_data)

type <- c("��","�񎩗�","�ڔ�")
train_data <- subset(train_data, !Info2 %in% type)

#�f�[�^�̕��ёւ��p�x��
train_freq <- train_data[order(train_data$Freq,decreasing = T),]
write.table(train_freq, "tmp/train_freq.txt", quote=F, 
            col.names=F, append=T)

#���[�h�N���E�h�\������
patarn <- brewer.pal(3,"Dark2")
wordcloud(train_freq$Term, train_freq$Freq, min.freq = 1)

