      program swwf

! variables
      complex*16 chi     ! wave function
      double precision q ! momenta
      double precision V0  ! well height
      complex*16 k         
            
      double precision r   ! coordinate
      double precision h   ! bin
      integer i            ! for r loop

! function
      complex*16 wffn  ! wave function (function)

! file 
      open(11,file="swwf_c_out.dat", status='replace')        

! input      
      q = 2.d0
      V0 = 10.d0

      k= cdsqrt( dcmplx(q**2 - 2.d0*V0) ) ! momentum in well
      write(*,*) k
      h = 0.1d0
            
      do i=1,100
      
         r = i*h
         chi = wffn(k,q,r)
         
         write(11,*) r, dreal(chi), dimag(chi)
      
      enddo
      
      write(*,*) 'end!'  ! successful execution

      end

! function
      complex*16 function wffn(k,q,r)
      
      double precision q ! momenta
      complex*16 k       
      double precision r   ! coordinate
      
      if (r <= 1.d0) then   

         wffn = sin(k*r)
      
      else 

         wffn = sin(k)*cos(q*(r-1.d0))
     $       +k/q*cos(k)*sin(q*(r-1.d0)) 
      
      endif
      
      end