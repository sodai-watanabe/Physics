      program asymptotic

! variables
      complex*16 psi     ! wave function
      double precision q ! momenta
      double precision V0  ! well height
      complex*16 k  
      complex*16 k0
      complex*16 f
           
      double precision r   ! coordinate
      double precision h   ! bin
      integer i            ! for r loop
      real(8) mu ,mevfm, V0c,b
      real(8) :: pi = 4.d0*atan(1.d0)
      real(8)  a0 ,re



! function
      complex*16 asy  ! wave function (function)
      complex*16 chi  ! wave function (function)

! file 
      open(11,file="in.dat")        
      open(12,file="out.dat")

! input      
      mevfm = 197.32698d0
      mu = 470.d0              !MeV (核力)
      b = 1.d0                 !fm  (井戸幅)
      V0c = -pi**2 /(8.d0*mu*(b/mevfm)**2)   ! MeV

      write(*,*) V0c
      
      read(11,*) q,V0

      k  = cdsqrt( dcmplx(q**2 - 2.d0*mu*V0) )  ! MeV
      k0 = cdsqrt( dcmplx(-2.d0*mu*V0) )        ! MeV

      write(*,*) "V0", V0, "q", q

      h = 0.1d0
            
      do i=1,100
      
         r = i*h                      !fm
         psi = asy(k/mevfm,q/mevfm,r,b)
         chi = sqrt(4.d0*pi)*r*psi

         write(12,*) r, dreal(chi), dimag(chi)

      enddo
      
      write(*,*) 'end!'  ! successful execution

      close(11)
      close(12)

      end


! wave function psi
      complex*16 function asy(k,q,r,b)
      
      real(8)    q   ! momenta
      complex*16 k       
      real(8)    r   ! coordinate
      real(8)    b   ! well width
      complex*16 C ! const

      complex*16 iunit
      iunit = (0.d0, 1.d0)

      C = exp(iunit*q*b)/(iunit*q)/(sin(k*b) + k/(iunit*q)*cos(k*b))

      if (r <= b) then   

         asy = C/r*sin(k*r)
      
      else 

         asy = C/r*( sin(k*b)*cos(q*(r-b))
     $               +k/q*cos(k*b)*sin(q*(r-b)) )

      endif

      end
