      program int

! variables
      double precision q    ! upper boundary
      double precision x    ! integration variable
      double precision Iint ! integration
            
      integer n              ! number of points
      double precision Delta ! bin
      integer i              ! for integration

! input      
      write(*,*) "value of q?"
      read(*,*) q

      n = 1000
      Delta = (q-0.d0)/n
      
      Iint = 0.d0  ! initialization
      
! integration
      do i=1,n
      
         x = 0.d0 + i*Delta
         Iint = Iint + ( sin(x-Delta) + sin(x) ) / 2.d0 * Delta

      enddo
     
      write(*,*) "q   integration   error"
      write(*,*) q, Iint, Iint -( 1.d0 - cos(q))
      
      write(*,*) 'end!'  ! successful execution
      
      end
