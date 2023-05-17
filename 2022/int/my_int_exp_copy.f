      program int

!variables
      real(8) q
      integer :: n, i, j
      real(8) :: Iint, x, hq, hx, a0, c1, c2, c3
      real(8) :: pi=4.d0*atan(1.d0)
      real(8) :: mevfm = 197.32698d0

! function
      real(8) integrand 


!input    
      n = 2000
      hq = 0.001d0
      

!file
      open(11, file = "my_int_-03_5.dat")


      a0=-0.3d0/5.d0


! integration
      do j = 1,n
      Iint = 0.d0

         q = j*hq
         hx = (2.d0*q - 0.d0)/n


         do i = 1,n
            x = i*hx
            Iint = Iint + (integrand(x - hx) + integrand(x))*hx/2.d0
         enddo

         ! c1,c2,c3について
         c1 = 0.5d0*(1.d0/((1/a0)**2 + q**2))
         c2 = -2.d0/(sqrt(pi)) * 1.d0/((1.d0/a0) + a0*q**2)
     $         *exp(-4.d0*q**2)/(2.d0*q)*Iint
         c2 = -2.d0/(sqrt(pi)) * 1.d0/((1.d0/a0) + a0*q**2)
     $         *exp(-4.d0*q**2)/(2.d0*q)*Iint
         
         c3 = -1.d0/(1.d0/(q*a0**2) + q) * (1.d0 - exp(-4.d0*q**2))
     $    /(2.d0*q)

         write(11,*) q*mevfm*5.d0, 1+c1+c2+c3   !R=5のとき、q*mevfm*5.d0をわすれずに

      enddo



      close(11)



      end


      real(8) function integrand(x)
         real(8) x
         integrand = exp(x**2)



      end