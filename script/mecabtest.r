
#install.packages("RMeCab", repos = "http://rmecab.jp/R")


###ライブラリーの読み込み#####
library("XLConnect")
library("tcltk")
library("RMeCab")
library("wordcloud")
library("RColorBrewer")


res <- RMeCabC("すもももももももものうち")
unlist (res)

res1 <- RMeCabC("おっそうだ(唐突)　わし(53)が撮った高専祭の写真動画データ欲しい人リンクDMで送るからいっちくり～　あと誰か氏が撮った写真や動画もくり～")
unlist(res1)

res2 <- RMeCabC("おっそうだ。わしが撮った高専祭の写真動画データ欲しい人、リンクをDMで送るから言ってくれ。あと誰かが撮った写真や動画もくれ～")
unlist(res2)

word <- RMeCabFreq("test/chabita.csv")

word <- subset(word,Info1 == "名詞")
unlist(word)

type <- c("数","非自立","接尾")
word <- subset(word, !Info2 %in% type)

#データの並び替え頻度順
word <- word[order(word$Freq,decreasing = T),]

#ワードクラウド表示する
patarn <- brewer.pal(3,"Dark2")
wordcloud(word$Term, word$Freq, min.freq = 1)




