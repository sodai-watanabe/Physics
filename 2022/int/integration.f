      program integration

!variables
      double precision x
      double precision q
      double precision hx
      double precision hq
      double precision g
      integer i
      integer j


      hx = 0.01d0
      hq = 0.01d0


      do i = 1,100

         q = i*hq
         hx = (q - 0.d0)/100
         g = 0.d0

         do j = 1,100

         x = j*hx
         g = g + sin(x)*hx


         enddo

      write(*,*) g, 1.d0 - cos(q)

      enddo


      end