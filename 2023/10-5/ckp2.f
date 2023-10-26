      program kp2

! variables
      complex*16 psi     ! wave function
      real(8) q ! momenta
      real(8) V0  ! well height
      complex*16 k  
      complex*16 k0
           
      real(8) r   ! coordinate
      real(8) h   ! bin
      integer i            ! for r loop
      real(8) mu ,mevfm, V0c,b,R0
      real(8) :: pi = 4.d0*atan(1.d0)

      real(8) inf,hr,Iint



! function
      complex*16 asy  ! wave function (function)
      real(8) ckp          ! correlation
      real(8) integrand,S

! file 
      open(11,file="out.dat")

! input      
      mevfm = 197.32698d0
      mu = 470.d0              !MeV (核力)
      b = 1.d0                 !fm  (井戸幅)
      R0 = 1.d0                !fm  (source size)
      V0 = -27.389             !MeV 井戸の高さ
      V0c = -pi**2 /(8.d0*mu*(b/mevfm)**2)   ! MeV

      write(*,*) V0c
      write(*,*) "V0", V0
      
      k0 = cdsqrt( dcmplx(-2.d0*mu*V0) )        ! MeV

      h = 0.1d0
      
      do i=1,4000
      
        q = i*h                                   ! MeV
        k  = cdsqrt( dcmplx(q**2 - 2.d0*mu*V0) )  ! MeV

        write(11,*) q, ckp(k/mevfm,q/mevfm,b,R0)

      enddo


      write(*,*) 'end!'  ! successful execution

      close(11)

      end




! wave function psi
      complex*16 function asy(k,q,r,b)
      
      complex*16 k       
      real(8)    q   ! momenta
      real(8)    r   ! coordinate
      real(8)    b   ! well width
      complex*16 C   ! const

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



! source function S
      real(8) function S(r,R0)
      
      real(8)    r    ! coordinate
      real(8)    R0   ! well width
      real(8) :: pi = 4.d0*atan(1.d0)

      S = exp(-r**2/(4.d0*R0**2))/((4.d0*pi*R0**2)**(3/2))
      
      end


! function : integrand
      real(8) function integrand(k,q,r,b,R0)
      real(8) S,R0
      

      complex*16 asy,k
      real(8) q,r,b
      integrand = (r**2)*S(r,R0)*(abs(asy(k,q,r,b))**2 
     $                          - (sin(q*r)/(q*r))**2)

      end


! function Iint 
      real(8) function ckp(k,q,b,R0)
      real(8) Iint,hr
      integer i,inf
      real(8) :: pi = 4.d0*atan(1.d0)

      real(8) integrand,q,r,b,R0
      complex*16 k

      Iint = 0.d0
      hr = 0.1d0
      inf = 10000

      do i = 1, inf

        r = i*hr
        Iint = Iint + (integrand(k,q,r,b,R0)
     $              + integrand(k,q,r - hr,b,R0))*hr/2.d0

      enddo

      ckp = 4.d0*pi*Iint

      end




