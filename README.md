# README or it didn't happen!

Repo ini menyediakan *source code* untuk seminar yang diadakan pada 24 Juli 2018 yang berjudul **Pengaruh Tingkat Penetrasi Internet terhadap Perekonomian Provinsi di Indonesia tahun 2010 sampai 2015**.

## Tentang makalah ini

Internet merupakan medium penyebaran informasi.
Sebagai medium penyebaran informasi, internet menyebarkan ilmu pengetahuan, mengurangi biaya dan memfasilitasi agar pekerjaan dapat dipercepat.
Dengan bertambahnya pengetahuan, pengurangan biaya, dan pekerjaan yang lebih cepat, produktivitas meningkat sehingga pendapatan ikut meningkat.
Makalah ini bertujuan untuk melihat perkembangan tingkat penetrasi internet di Indonesia dan pengaruhnya terhadap pertumbuhan ekonomi.
Data dikumpulkan dari Badan Pusat Statistik dalam bentuk panel dengan 33 provinsi selama tahun 2010 sampai 2015.
Makalah ini menunjukkan bahwa tingkat penetrasi internet di Indonesia mengalami pertumbuhan.
Hasil pemodelan dengan OLS menunjukkan bahwa peningkatan tingkat penetrasi internet sebesar 10 poin persen dapat meningkatan pertumbuhan PDRB ADHK sebesar 1,49 persen.

## About this paper

Internet is a medium to spread information.
As a medium to spread information, internet spread knowledge, reduce cost, and facilitate things to make work faster.
With more knowledge, reduced cost, and faster work, productivity will increase and so will profit.
This paper investigates the growth of internet penetration rate in Indonesia and its impact to economic growth.
Data collected from Indonesia Statistics in panel consist of 33 provinces from 2010 to 2015.
This paper shows that internet penetration rate has been raising from 2010 to 2015.
Results from OLS shows that 10 percentage points increase in internet penetration raises real GDP by 1.49 percent.

## Kontributor

Anugerah Karta Monika, S.Si, ME sebagai dosen pembimbing.

## Struktur Folder/Direktori

these are the project structure

```
.
├── apx
│   ├── lampiran.aux
│   ├── lampiran.tex
│   └── template.tex
├── data
│   ├── gg_tbl.R
│   ├── iProvinsi.csv
│   ├── modelling.R
│   └── net_clean.csv
├── img
│   ├── akses-1.png
│   ├── galat-density.png
│   ├── hetero.png
│   ├── normal-qqplot.png
│   └── Promotion.png
├── pres.pdf
├── pres.rmd
├── README.md
├── sem.pdf
├── sem.rmd
└── uni.bib
```

Kamu sekarang sedang membaca `README.md`.
Terdapat 2 file utama, yaitu `sem.pdf` untuk makalah dan `press.pdf` untuk presentasi.
Masing-masing file ditulis menggunakan Rmarkdown, dengan nama yang sama yaitu `sem.rmd` untuk makalah dan `press.rmd` untuk presetasi.
file `uni.bib` adalah file bibliografi yang digunakan untuk daftar pustaka.
file `LICENSE` adalah dokumen yang berisikan lisensi dari repo ini.

### apx

Folder apx menyimpan file untuk lampiran (*appendix*) dan juga template (untuk makalah).
Sementara file `lampiran.aux` adalah file yang dibentuk sebagai efek samping dari mengcomplie file latex.
*jangan terlalu mengkhawatirkan file .aux*.

### data

Folder data menyimpan data dan juga *R* script untuk mengolah data tersebut.
Esktensi untuk file data adalah `.csv` sementara untuk script R adalah `.R`.

File `iProvinsi.csv` menyimpan data mengenai kode provinsi dan nama provinsi.
Kode provinsi dinamai *i* supaya konsisten dengan dimensi individu dalam data panel.
File `net_clean.csv` menyimpan data mengenai variabel yang digunakan dalam makalah.
variabel tersebut antara lain

- i sebagai dimensi/indeks individu (provinsi)
- t sebagai dimensi/indeks waktu (tahun)
- Y adalah Produk Domestik Bruto
- K adalah Pembentukkan Modal Tetap Bruto
- H adalah Angka Partisipasi Kasar Sekolah Menengah.
- L adalah Tingkat Kesempatan Kerja
- I adalah Tingkat Penetrasi Internet.

File `gg_tbl.R` menyimpan R script untuk pembentukan gambar dan tabel dalam makalah.
gambar yang dihasilkan script ini adalah `akses-1.png`.
Sedangkan file `modelling.R` menyimpan script untuk melakukan analisis regresi data panel.
Kebanyakan dari analisis tersebut adalah dalam pembentukkan model.
file ini juga menghasilkan gambar, yakni `galat-density.png`, `hetero.png`, dan `normal-qpqlot.png`.

### img

Folder img menyimpan gambar hasil dari script pada filder data.
Semua gambar pada folder ini dihasilkan oleh script dalam folder data, kecuali `Promotion.png`.
File `Promotion.png` tidak diciptakan dari diatas, melainkan dari [draw.io](draw.io).
file ini digunakan sebagai promosi ketika presentasi.

## Tools

Berikut adalah alat yang saya gunakan untuk membuat makalah dan presentasi.
- Tex Distribution (LaTex/MikTeK/TexLive)
- R (and Rstudio)
- (Neo)Vim.

Untuk paket R, berikut ini adalah paket yang saya gunakan

- tidyverse
- rmarkdown
- plm

```{r}
install.packages(c("tidyverse","rmarkdown","plm"))
```

Meng-*install* tidyverse secara otomatis juga menginstall berbagai paket-paket lainnya seperti ggplot, dplyr, dan purr.
Rmarkdown digunakan untuk menulis file `.Rmd`, sedangkan plm digunakan untuk melakukan analisis data panel.

## Compiling

Saya menggunakan Linux, lebih sepsifik lagi, Ubuntu LTS 16.04 dengan Neovim sebagai text editor.
Jika kalian juga menggunakan linux dan Neovim silahkan tambahkan baris berikut ke file `init.vim` kalian, atau file `.vimrc` bagi pengguna vim.

```{sh}
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--no-save<CR>
```

Tekan <F5> ketika dalma file rmd untuk mengcompile.

Jika kamu menggunakan RStudio, mengcompile dai rmd ke pdf menjadi lebih mudah.
Kau hanya perlu menekan tombol *knit* yang ada di panel source.

## Lisensi

This Repo is using GPLv3.
Silahkan unduh dan gunakan kembangkan repo ini semau kamu, asalkan turut berkontribusi ke dunia *open source* dengan turut menggunakan GPL.

*I open sourced my code and so you should too*.
