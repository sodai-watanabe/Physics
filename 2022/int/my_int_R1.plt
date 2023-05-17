# 初期化
reset
# 出力をepfにする
#set terminal postscript eps enhanced color
#set output 'swwf.eps' 

# ラベルのフォントの設定
#set xlabel font "Helvetica,25"
#set ylabel font "Helvetica,25"
# メモリ文字のフォントの設定
#set tics font "Helvetica,25"

# ラベルの位置調整
set ylabel offset -4,0

# X軸の余白
#set tmargin 5
#set bmargin 5

# Y軸の余白
#set rmargin 5
#set lmargin 15

# ラベル
set xlabel "q [MeV]"
set ylabel "c(q) [nondimension]"

# 凡例なし
set nokey

# 軸の範囲
set xrange [0.:400]
set yrange [0.5:1.5]

# ゼロ軸を描画
#set zeroaxis

# プロット
plot "my_int_-03.dat" u 1:2 w l lw 4 dt 3 lc rgb "black"
replot "my_int_03.dat" u 1:2 w l lw 4 dt 4 lc rgb "red"
replot "my_int_10.dat" u 1:2 w l lw 4  lc rgb "blue"
 