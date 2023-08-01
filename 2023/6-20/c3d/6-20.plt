# 初期化
reset
# 出力をepfにする
#set terminal postscript eps enhanced color
#set output 'swwf.eps' 

# ラベルのフォントの設定
set xlabel font "Helvetica,20"
set ylabel font "Helvetica,20"
# メモリ文字のフォントの設定
set tics font "Helvetica,30"

# ラベルの位置調整
set ylabel offset -4,0

# X軸の余白
set tmargin 4
set bmargin 4

# Y軸の余白
set rmargin 4
set lmargin 4

# ラベル
set xlabel "qR [nondimension]"
set ylabel "R/a0 [nondimension]"

# 凡例
#set nokey
set key font "Helvetica,25"

# 軸の範囲
set xrange [0:2]
set yrange [-1.5:1.5]
set zrange [0:2]

# ゼロ軸を描画
#set zeroaxis

# プロット
set pm3d map
splot "6-20.dat" title "cll"
#splot x*x*exp(-x*x)*y*y*exp(-y*y)　matrix nonuniform notitle
