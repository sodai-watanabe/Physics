      program cll
! 概要:相関関数を手計算でqR,R/a0の関数としてまとめた。横軸qR,縦軸R/a0の平面に相関関数を3dplotしたい
! ここで、x=qR, y=R/a0, z=re/R としている。zは自分で入力する。(re<0,R>0よりz<0)

! variables
      real(8) Iint            ! integration
      real(8) t            ! integration
           
      real(8) h, ht              ! bin
      real(8) MeVfm
      real(8) x, y, z, c1, c2, c3
      real(8) :: pi=4.d0*atan(1.d0)
      integer i ,j ,k, n         
! function
      real(8) integrand


! file
      open(11,file="6-20.dat") 


! input
      MeVfm = 197.d0
      h = 0.01d0
      n = 100
      z = 0.d0


! output
      do i = -300, 300
            y = i*h

            do j = 1, 300
                  x = j*h
                  Iint = 0.d0
                  ht = 2*x/n

                  ! integration
                  do k = 1, n
                        t = k*ht
                        Iint = Iint + (integrand(t)
     $                     + integrand(t - ht))*ht/2.d0
                  enddo

                  c1 = (1.d0/2.d0)/( ((z/2.d0)*x**2 - y)**2 + x**2 )
     $                  *(1.d0 - z/(2.d0*sqrt(pi)))

                  c2 = 1.d0/sqrt(pi) * ((z/2.d0)*x**2 - y) 
     $                   / (((z/2.d0)*x**2 - y)**2 + x**2) 
     $                   * exp(-4.d0*x**2)/x * Iint

                  c3 = -(1.d0/2.d0)/(((z/2.d0)*x**2 - y)**2 + x**2) 
     $                   * (1.d0 - exp(-4.d0*x**2))


                  write(11,*) x, y, 1+c1+c2+c3

            enddo

            write(11,*) " "

      enddo

      close(11)
 
      end


! function : integrand
      real(8) function integrand(t)
      real(8) t
      integrand = (exp(t**2))

      end