      program swwf

! variables
      double precision chi ! wave function
      double precision k,q ! momenta
      double precision V0  ! well height
            
      double precision r   ! coordinate
      double precision h   ! bin
      integer i            ! for r loop

! function
      double precision wffn  ! wave function (function)

! file 
      open(11,file="swwf_out.dat")        

! input      
      q = 2.d0
      V0 = -10.d0

      k= sqrt( q**2 - 2.d0*V0 ) ! momentum in well
      
      h = 0.1d0
            
      do i=1,100
      
         r = i*h
         chi = wffn(k,q,r)
         
         write(11,*) r, chi
      
      enddo
      
      write(*,*) 'end!'  ! successful execution

      end

! function
      double precision function wffn(k,q,r)
      
      double precision k,q ! momenta
      double precision r   ! coordinate
      
      if (r <= 1.d0) then   

         wffn = sin(k*r)
      
      else 

         wffn = sin(k)*cos(q*(r-1.d0))
     $       +k/q*cos(k)*sin(q*(r-1.d0)) 
      
      endif
      
      end