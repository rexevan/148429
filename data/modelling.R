library(plm)
library(lmtest)
library(broom)
library(ggplot2)
theme_set(theme_bw())
net <- read.csv("net_clean.csv")

# Jadikan p.dataframe
nep <- pdata.frame(net, index = c("i", "t"), drop.index = F)

# Alpha
alpha <- 0.05

# Spesifikasi Model
f1 <- log(Y) ~ log(K) + log(H) + log(L) + log(I)

# Estimasi Model

POLS <- plm(f1, nep, model = "pooling") # Pooled OLS
FE <- plm(f1, nep, model = "within") # Fixed / Within
RE <- plm(f1, nep, model = "random") # Random
VC <- pvcm(f1, nep, model = "within")

# POLS vs FE vs RE -----

# Uji Chow
pooltest(POLS, VC)

# Uji Honda
plmtest(POLS, type = "honda", effect = "individual")

# Uji Hausmann
phtest(FE, RE)

# Heteroskedastisitas Galat
hetero <- qplot(y = resid(FE), x = fitted(FE),
                ylab = "Residual", xlab = "Fitted Value")

# ggsave(plot = hetero, filename = "Lampiran-hetero.png", device = "png")

# Uji Breusch-Godfrey
pbgtest(FE, order = 1)
pbgtest(FE)

# Jarque Bera
normtest::jb.norm.test(resid(FE)); qchisq(1-alpha, 2)

# Density Plot
denseplot <- qplot(resid(FE), geom = "density", xlab = "Residual", ylab = NULL)

# ggsave(plot = denseplot, filename = "Lampiran-galat-density.png", device = "png")

# qqplot
#qqnorm(resid(FE))
#qqline(resid(FE))

# Robust Standard Error HAC
HAC <- vcovHC(FE, method = "arellano")

# Inferensia
library(lmtest)

## Statistik t
coeftest(FE, vcov. = HAC, df = NULL) # Uji Wald
coeftest(FE, vcov. = HAC, df = FE$df.residual) # Uji t

## Selang Kepercayaan
coefci(FE, vcov. = HAC)

## Statistik F
z <- Within(log(nep$Y)) # Transformasi Within
sst <- sum(z^2) # Sum Square Total
df1 <- 4 # df1
ssr <- sum(resid(FE)^2) # Sum Square Residual
df2 <- df.residual(FE) # df residual

F_stat <- ((sst-ssr)/df1)/((ssr)/df2) # Nilai statistik F
pf(F_stat, df1, df2, lower.tail = F) # p-Value

## R-Squared
r.squared(FE)
