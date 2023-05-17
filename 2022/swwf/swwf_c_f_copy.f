      program swwf2
      !swwfでは無次元の議論。ここでは、単位をつけて議論してみる。

! variables
      complex*16 chi     ! wave function
      double precision q ! momenta
      double precision V0  ! well height
      complex*16 k  
      complex*16 k0  
           
      double precision r   ! coordinate
      double precision h   ! bin
      integer i            ! for r loop
      real(8) mu ,mevfm, V0c,b
      real(8) :: pi = 4.d0*atan(1.d0)
      real(8)  a0 



! function
      complex*16 wffn  ! wave function (function)

! file 
      open(11,file="swwf_x_out.dat")        
      open(12,file="swwf_c_f_copy_in.dat")       



! input      
      mevfm = 197.32698d0
      mu = 470.d0           !MeV 
      b = 1.d0                 !fm
      V0c = -pi**2 /(8.d0*mu*(b/mevfm)**2)

      write(*,*) V0c

      
      q = 2.d0
      V0 = 10.d0
      read(12,*) q,V0

      k0 = cdsqrt( dcmplx(-2.d0*mu*V0) )
      a0 = b* (1.d0 - (tan((k0/mevfm)*b)) / ((k0/mevfm)*b)) 

      write(*,*) V0, a0

      k = cdsqrt( dcmplx(q**2 - 2.d0*mu*V0) )       ! momentum in well    !MeV

      
      h = 0.1d0
            
      do i=1,100
      
         r = i*h                    !fm
         chi = wffn(k/mevfm, q/mevfm, r)

         if (dimag(k)==0.d0) then         
         write(11,*) r, dreal(chi)

         else if (dreal(k)==0.d0) then
         write(11,*) r, dimag(chi)

         endif

      enddo
      
      write(*,*) 'end!'  ! successful execution

      close(11)
      close(12)

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