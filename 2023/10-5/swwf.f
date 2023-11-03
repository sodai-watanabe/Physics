      program swwf2

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
      open(11,file="in.dat")        
      open(12,file="out.dat")

! input      
      mevfm = 197.32698d0
      mu = 470.d0           !MeV (核力)
      b = 1.d0              !fm
      V0c = -pi**2 /(8.d0*mu*(b/mevfm)**2)   ! MeV

      write(*,*) V0c
      
      read(11,*) q,V0

      k0 = cdsqrt( dcmplx(-2.d0*mu*V0) )
      a0 = b*(1.d0 - (tan((k0/mevfm)*b)) / ((k0/mevfm)*b)) 

      write(*,*) "V0", V0, "a0", a0, "q", q

      k = cdsqrt( dcmplx(q**2 - 2.d0*mu*V0) )       ! momentum in well    !MeV

      
      h = 0.1d0
            
      do i=1,100
      
         r = i*h                    !fm
         chi = wffn(k/mevfm, q/mevfm, r, b)

         if (dimag(k)==0.d0) then         
         write(12,*) r, dreal(chi)

         else if (dreal(k)==0.d0) then
         write(12,*) r, dimag(chi)

         endif


      enddo
      
      write(*,*) 'end!'  ! successful execution

      close(11)
      close(12)

      end

! function
      complex*16 function wffn(k,q,r,b)
      
      double precision q ! momenta
      complex*16 k       
      double precision r   ! coordinate
      double precision b   ! well width
      
      if (r <= b) then   

         wffn = sin(k*r)
      
      else 

         wffn = sin(k*b)*cos(q*(r-b))
     $       +k/q*cos(k*b)*sin(q*(r-b)) 
      
      endif
      
      end