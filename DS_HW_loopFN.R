#Function for a loop 


loop.coin <- rep(i, 200)

coin.loop <- sample(coin, 200, replace = T, prob = NULL)
for (i in 1:200){
  coin.loop
  loop.coin[i] <- mean(loop.coin)
}


coin.loop


loop.coin


# Make a tabel of the set 


Coins.Fliped <- matrix(c(tossed_c, tossed.1, tossed.2, tossed.3),)
colnames(Coins.Fliped) <- c("tossed_c", "tossed.1", "tossed.2", "tossed.3")
rownames(Coins.Fliped) <- c("heads", "tails")


prop.table(Coins.Fliped)

t.1 <- matrix(tossed.1)






looped.coins <- matrix(NA, nrow=200, ncol = 200)
for (i in 1:200) {
  looped.coins[i, ] <- sample(c(1,0), 2, replace = T, prob = NULL)
}

mean(looped.coins) #mean of looped.coins
sd(looped.coins) #Standard deviation of looped.coins
quantile(looped.coins) #quartiles of looped.coins
median(looped.coins) #median of looped.coins








prop.table(table(sample(c("heads","tails"), 200, replace=TRUE)))

prop.table(table(sample(c("heads","tails"), 200, replace=TRUE)))

prop.table(table(sample(c("heads","tails"), 1000, replace=TRUE)))





