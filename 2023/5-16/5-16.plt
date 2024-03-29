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
set tmargin 3
set bmargin 4

# Y軸の余白
set rmargin 5
set lmargin 15

# ラベル
set xlabel "E [MeV]"
set ylabel "f_0(E) [fm]"

# 凡例
#set nokey
set key font "Helvetica,30"

# 軸の範囲
#set xrange [0.:2000]
#set yrange [0.7:1.3]

# ゼロ軸を描画
#set zeroaxis

# プロット
plot "f-E.dat" u 1:2 w l lw 4 dt 3 lc rgb "red" title "Re(f)"
replot "f-E.dat" u 1:3 w l lw 4 dt 4 lc rgb "blue" title "Im(f)"
#replot "my_int_03_5.dat" u 1:2 w l lw 4 dt 4 lc rgb "red"
#replot "my_int_10_5.dat" u 1:2 w l lw 4  lc rgb "blue"
 