      program int

!variables
      real(8) q
      integer :: n, i, j
      real(8) :: Iint, x, hq, hx

! function
      real(8) integrand 


!input    
      n = 1000
      hq = 0.001d0
      

!file
      open(11, file = "my_int.dat")

! integration
      do j = 1,n
      Iint = 0.d0

         q = j*hq
         hx = (1.d0*q - 0.d0)/n

         do i = 1,n
            x = i*hx
            Iint = Iint + (integrand(x - hx) + integrand(x))*hx/2.d0
         enddo

         write(11,*) q, Iint

      enddo



      close(11)



      end


      real(8) function integrand(x)
         real(8) x
         integrand = sin(x)



      end