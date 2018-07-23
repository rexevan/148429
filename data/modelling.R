library(plm)
library(lmtest)
library(broom)
library(ggplot2)
theme_set(theme_bw())
net <- read.csv("data/net_clean.csv")

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
coeftest(FE, vcov. = HAC)

## Selang Kepercayaan
coefci(FE, vcov. = HAC)

## Statistik F
pwaldtest(FE, vcov = HAC, test = "F")

## R-Squared
r.squared(FE)

# Beberapa nilai lainnya

## Heteros and Autocor Consistent Standard Error
HAC

## Fixed Effect
fixef(FE)
