      program cll_zerorange
! 概要：式(47)について、指定されたa0で横軸kでプロット。[re=0、ソースサイズR=1、次元a0[fm],k[MeV]]

!variables
      real(8) k
      integer :: n, i, j
      real(8) :: Iint, x, hk, hx, a0, c1, c2, c3
      real(8) :: pi=4.d0*atan(1.d0)
      real(8) :: mevfm = 197.32698d0

! function
      real(8) integrand 


!input    
      n = 2000
      hk = 0.001d0
      a0=-0.3d0
      

!file
      open(11, file = "5-25.dat")


! integration
      do j = 1,n
      Iint = 0.d0

         k = j*hk
         hx = (2.d0*k)/n


         do i = 1,n
            x = i*hx
            Iint = Iint + (integrand(x - hx) + integrand(x))*hx/2.d0
         enddo

         ! c1,c2,c3について
         c1 = 0.5d0*(1.d0/((1/a0)**2 + k**2))
         c2 = -2.d0/(sqrt(pi)) * 1.d0/((1.d0/a0) + a0*k**2)
     $         *exp(-4.d0*k**2)/(2.d0*k)*Iint
         c3 = -1.d0/(1.d0/(k*a0**2) + k) * (1.d0 - exp(-4.d0*k**2))
     $    /(2.d0*k)

         write(11,*) k*mevfm, 1+c1+c2+c3
      enddo

      write(*,*) 'a0:',a0


      close(11)



      end


      real(8) function integrand(x)
         real(8) x
         integrand = exp(x**2)



      end