# Packages at the top !!
library(tidyverse)
library(ggthemes)
library(scales)
library(grid)
library(gridExtra)

# Tema plot mirip 538. Font iosevka

#font_family <- "iosevka"
font_family <- "Roboto"
theme_set(theme_fivethirtyeight(base_family = font_family, base_size = 15))

# Input Data
net <- read_csv("net_clean.csv")

# Custom Footer
## gg adalah gambar dari ggplot
new_black <- "#595959"
new_grey <- "#F0F0F0"
font_source <- "iosevka"
size_source <- 12
text_source <- c(" SUMBER: BADAN PUSAT STATISTIK")

footer_538 <- function(gg, text.footer = text_source) {
  text.Name <- textGrob(text.footer, x=unit(0, 'npc'),
                        gp=gpar(col='white', fontfamily=font_source, fontsize=size_source),
                        hjust=0)
  footer <- grobTree(rectGrob(gp=gpar(fill='#5B5E5F', lwd=0)), text.Name)
  grid.arrange(gg, footer, heights=unit(c(0.94, 0.06), c('npc', 'npc')))
}

# Tabel Ringkasan Statistik -----
tbl_sum_stat <- net %>%
  select(-i, -t) %>%
  gather(Vars, Data) %>%
  group_by(Vars) %>%
  summarise(MIN = min(Data)   %>% round(2),
            MAX = max(Data)   %>% round(2),
            MEAN = mean(Data) %>% round(2),
            SD = sd(Data)     %>% round(2),
            CV = SD/MEAN      %>% round(2))

# Akses-1 -----

## Histogran - Lebar 5% : center 5/2 = 2.5

clr_2010 <- "#F1C600"
clr_2015 <- "#72C8C1"

gg1 <- net %>%
  filter(t %in% c(2010, 2015)) %>%
  select(i, t, I) %>%
  ggplot(aes(x = I)) +
  geom_histogram(binwidth = 5, aes(fill = factor(t)),
                 color = "White", show.legend = F, center = 2.5) +
  scale_x_continuous(limits = c(0, 50), breaks = seq(0, 50, 5),
                     labels = c("0%", seq(5, 50, 5))) +
  scale_y_continuous(breaks = seq(0, 20, 3)) +
  facet_wrap(~ t, ncol = 1) +
  theme(strip.text = element_blank()) +
  annotate(geom = "text", x = 40, y = 12,
           label = c(2010, 2015), color = c(clr_2010, clr_2015),
           family = font_family, size = 12) +
  scale_fill_manual(values = c(clr_2010, clr_2015)) +
  geom_hline(yintercept = 0, size = 0.25)


ggsave(
  plot = footer_538(gg1),
  filename = "akses-1.png",
  device = "png",
  dpi = 300,
  height = 12,
  width = 18,
  units = "cm"
)
