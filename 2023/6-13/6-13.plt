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
set xlabel "k [MeV]"
set ylabel "c(k) [nondimension]"

# 凡例
#set nokey
set key font "Helvetica,25"

# 軸の範囲
#set xrange [0.:400]
set yrange [0.5:1.4]

# ゼロ軸を描画
#set zeroaxis

# プロット
!plot "R1-20.dat" u 1:2 w l lw 4 dt 3 lc rgb "red" title "R=1fm"
!replot "R5-20.dat" u 1:2 w l lw 4 dt 4 lc rgb "blue" title "R=2fm"
plot "10.dat" u 1:2 w l lw 4  lc rgb "green" title "a0=10fm"
replot "-10.dat" u 1:2 w l lw 4 dt 3 lc rgb "black" title "a0=-10fm"
replot "03.dat" u 1:2 w l lw 4  lc rgb "red" title "a0=0.3fm"
replot "-03.dat" u 1:2 w l lw 4  lc rgb "blue" title "a0=-0.3fm"
