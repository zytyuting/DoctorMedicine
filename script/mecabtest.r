
#install.packages("RMeCab", repos = "http://rmecab.jp/R")


###���C�u�����[�̓ǂݍ���#####
library("XLConnect")
library("tcltk")
library("RMeCab")
library("wordcloud")
library("RColorBrewer")


res <- RMeCabC("�������������������̂���")
unlist (res)

res1 <- RMeCabC("����������(����)�@�킵(53)���B��������Ղ̎ʐ^����f�[�^�~�����l�����NDM�ő��邩�炢��������`�@���ƒN�������B�����ʐ^�⓮�������`")
unlist(res1)

res2 <- RMeCabC("�����������B�킵���B��������Ղ̎ʐ^����f�[�^�~�����l�A�����N��DM�ő��邩�猾���Ă���B���ƒN�����B�����ʐ^�⓮�������`")
unlist(res2)

word <- RMeCabFreq("test/chabita.csv")

word <- subset(word,Info1 == "����")
unlist(word)

type <- c("��","�񎩗�","�ڔ�")
word <- subset(word, !Info2 %in% type)

#�f�[�^�̕��ёւ��p�x��
word <- word[order(word$Freq,decreasing = T),]

#���[�h�N���E�h�\������
patarn <- brewer.pal(3,"Dark2")
wordcloud(word$Term, word$Freq, min.freq = 1)




