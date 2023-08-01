# 初期化
reset
# 出力をepfにする
#set terminal postscript eps enhanced color
#set output 'swwf.eps' 

# ラベルのフォントの設定
set xlabel font "Helvetica,20"
set ylabel font "Helvetica,20"
set zlabel font "Helvetica,20"

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
set xlabel "ReE[MeV]"
set ylabel "ImagE[MeV]"
set zlabel "re"

# 凡例
#set nokey
set key font "Helvetica,25"

# 軸の範囲
set xrange [0:50]
set yrange [-50:0]
set zrange [-5:0]

# ゼロ軸を描画
#se3t zeroaxis

# プロット
set pm3d map
splot "6-20.dat" title "re[fm]"
#splot x*x*exp(-x*x)*y*y*exp(-y*y)　matrix nonuniform notitle
