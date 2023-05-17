      program correlation

!variables
      real(8) q_, a0_, Cll, C
      real(8) hq_, 
      real(8) :: pi = 4.d0*atan(1.d0)

!file 
      open(11,file="correlation_in.dat")      
      open(12,file="correlation_out.dat")      

!input      
      read(11,*) a0_


! plot       !刻み幅などよくわかっていない。 !関数Cllは一回定数Cに入れる？
      hq_ = 0.001d0

      do i=1,2000

         q_ = i*hq_
         C = Cll(a0_, q_)

         write(12,*) q_, C
      
      enddo



!file
      close(11)
      close(12)

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


! function
      real(8) function Cll(a0_, q_)
      real(8) q_, a0_, Iint
      real(8) :: pi = 4.d0*atan(1.d0)


! my_int_exp.fを使いたいが、ほかのファイルの読み込みとかわからない。
      Iint = 

! 代入      !だいぶ汚いのでミスあるでしょう。
      Cll = 0.5d0/(1.d0/a0_**2 + q_**2) - (2.d0*a0_/sqrt(pi))*(1.d0/(1.d0/a0_**2 + q_**2))*((exp(-4.d0*q_**2))/(2.d0*q_))*Iint
  $          - (1.d0/(1.d0/a0_**2 + q_**2))*(1.d0 - (exp(-4.d0*q_**2)))/(2.d0*q_)


end


