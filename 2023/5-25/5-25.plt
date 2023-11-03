# 初期化
reset
# 出力をepfにする
#set terminal postscript eps enhanced color
#set output 'cll.eps' 
#set term pdf
#set output 'cll.pdf'

# ラベルのフォントの設定
set xlabel font "Helvetica,25"
set ylabel font "Helvetica,25"
# メモリ文字のフォントの設定
#set xtics 初期値, 増分, 終了値
set tics font "Helvetica,30"
set ytics 0, 1, 12 font "Helvetica,30"

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
set ylabel "[nondimension]"

# 凡例なし
set nokey
set key font "Helvetica,25"

# 軸の範囲
#set xrange [0:50]
set yrange [0:12]

# ゼロ軸を描画
#set zeroaxis

# プロット

plot "5-25.dat" u 1:2 w l lw 4 dt 1 lc rgb "red" title "cll"
#replot "5-25.dat" u 1:3 w l lw 4 dt 2 lc rgb "green" title "1+c1"
#replot "5-25.dat" u 1:4 w l lw 4 dt 3 lc rgb "sea-green" title "1+c2"
#replot "5-25.dat" u 1:5 w l lw 4 dt 4 lc rgb "light-green" title "1+c3"

#replot "my_int_03_5.dat" u 1:2 w l lw 4 dt 4 lc rgb "red"
# replot "my_int_10_5.dat" u 1:2 w l lw 4  lc rgb "blue"
 