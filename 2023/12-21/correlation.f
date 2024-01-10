      program correlation
! variables
      real(8) q ! momenta
      real(8) mu ,mevfm, V0c,b,R0
      real(8) :: pi = 4.d0*atan(1.d0)
      complex*16 k0
      integer i ,j ,n         ! for r loop
      real(8) hq              ! bin


! variables for ckp
      complex*16 psi     ! wave function
      real(8) V0  ! well height
      complex*16 k
      real(8) r   ! coordinate
      real(8) inf,hr,a
      
! variables for cll
      complex*16 f            ! scattering amplitude
      real(8) IintForll            ! integration
      real(8) absf_sq         ! |f|^2
      complex*16 a0
      real(8) x,hx,re
      real(8) c1, c2, c3      ! cll = 1 + c1 + c2 + c3

! variables for cll2
      complex*16 f2
      real(8) c12, c22, c32      ! cll = 1 + c1 + c2 + c3

! function for ckp
      complex*16 asy  ! wave function (function)
      real(8) ckp          ! correlation
      real(8) integrand,S

! function for cll
      complex*16 func
      real(8) integrandll

! function for cll2
      complex*16 func2

! file
      open(11,file="correlation.dat")

! input      
      mevfm = 197.32698d0
      mu = 470.d0           !MeV (核力)
      b = 1.d0/mevfm        !1/MeV (井戸幅)
      hq = 0.1d0
      n = 4000
      R0 = 1.d0/mevfm       !1/MeV (source size)
      R0 = 5.d0/mevfm       !1/MeV (source size)
      V0 = -50.2            !MeV 井戸の高さ
      V0 = -160.389         !MeV 井戸の高さ
      V0 = 58.5             !MeV 井戸の高さ
      V0 = -111.2d0         !MeV 井戸の高さ(a0=10)
      V0 = 2158.5            !MeV 井戸の高さ
      V0 = -27.389          !MeV 井戸の高さ
      V0 = -94.55          !MeV 井戸の高さ
      V0c = -pi**2 /(8.d0*mu*b**2)                            ! MeV

! calculate k0
      k0 = cdsqrt( dcmplx(-2.d0*mu*V0) )                      ! MeV

! calculate a0 and re for cll
      a0 = b*(1.d0 - tan(k0*b)/(k0*b))                        ! 1/MeV
      re = b*(1.d0 - b**2/(3.d0*a0**2) - 1.d0/(k0**2*a0*b))   ! 1/MeV

      
      do j=1, n
      
        q = j*hq
      
        ! for ckp
        k  = cdsqrt( dcmplx(q**2 - 2.d0*mu*V0) )               ! MeV
        a = ckp(k/mevfm,q/mevfm,b,R0)

      
        ! for cll
        IintForll = 0.d0
        hx = (2.d0*q*R0)/n
        do i = 1, n
            x = i*hx
            IintForll = IintForll + (integrandll(x)
     $                  + integrandll(x - hx))*hx/2.d0
        enddo

        f  = func(q, a0, re)
        f2 = func2(q, V0, mu, b)

        ! c1
        absf_sq = dreal(f)**2 + dimag(f)**2
        c1 = absf_sq/(2.d0*R0**2)*(1.d0 - (re/R0)/(2.d0*sqrt(pi)))

        ! c2
        c2 = 2.d0*dreal(f)/(sqrt(pi)*R0)*IintForll/(2.d0*q*R0)
     $     *exp(-(2.d0*q*R0)**2)

        ! c3
        c3 = -dimag(f)/R0*(1.d0 - exp(-(2.d0*q*R0)**2))/(2.d0*q*R0)

        ! c12
        absf_sq = dreal(f2)**2 + dimag(f2)**2
        c12 = absf_sq/(2.d0*R0**2)*(1.d0 - (re/R0)/(2.d0*sqrt(pi)))

        ! c22
        c22 = 2.d0*dreal(f2)/(sqrt(pi)*R0)*IintForll/(2.d0*q*R0)
     $     *exp(-(2.d0*q*R0)**2)

        ! c32
        c32 = -dimag(f2)/R0*(1.d0 - exp(-(2.d0*q*R0)**2))/(2.d0*q*R0)



        write(11,*) q, 1+c1+c2+c3, 1+c12+c22+c32,
     $   1+ckp(k/mevfm,q/mevfm,b*mevfm,R0*mevfm)
        !write(11,*) q, 1+c1+c2+c3
        !write(11,*) q, 1+c3
        !write(11,*) q, IintForll
      enddo


      write(*,*) "R0:",R0*mevfm,"b:",b*mevfm,"V0:",V0
      write(*,*) 'a0:' , real(a0*mevfm), 're:', re*mevfm
      write(*,*) 'end!!'  ! successful execution

      close(11)

      end

!!!!!!!!!!!!!!!!!!!!!!!  function for ckp  !!!!!!!!!!!!!!!!!!!!!!!!!!!

! wave function psi
      complex*16 function asy(k,q,r,b)
      
      complex*16 k       
      real(8)    q   ! momenta
      real(8)    r   ! coordinate
      real(8)    b   ! well width
      complex*16 C   ! const

      complex*16 iunit
      iunit = (0.d0, 1.d0)

      C = exp(iunit*q*b)/(iunit*q)/(sin(k*b) 
     $          + k/(iunit*q)*cos(k*b))

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

      real(8) integrand,integrand0,q,r,b,R0
      real(8) S
      complex*16 asy
      complex*16 k

      Iint = 0.d0
      hr = 0.1d0
      inf = 100

c     r=0の時、asyが発散するので場合分け。個別で計算したものをintegrand0とする。
      integrand0 = (r**2)*S(r,R0)
     $             *(abs(k/q/(sin(k*b)+k/(iunit*q)*cos(k*b)))**2 - 1.d0)

      do i = 1, inf

        r = i*hr
        if (i == 1) then

          Iint = Iint + (integrand(k,q,r,b,R0)
     $                + integrand0)*hr/2.d0

        else 
          Iint = Iint + (integrand(k,q,r,b,R0)
     $              + integrand(k,q,r - hr,b,R0))*hr/2.d0
        endif
        

        write(12,*) integrand(k,q,r - hr,b,R0)

      enddo


      ckp = 4.d0*pi*Iint

      end


!!!!!!!!!!!!!!!!!!!!!!!  function for cll  !!!!!!!!!!!!!!!!!!!!!!!!!!!


! function : func
      complex*16 function func(q, a0, re)
      complex*16 iunit
      real(8) q
      complex*16 a0
      real(8) re

      iunit = (0.d0, 1.d0)
      
      func = 1.d0/((-1.d0/a0) + (re/2.d0)*(q**2) - (iunit*q))

      end


! function : integrand for cll
      real(8) function integrandll(x)
      real(8) x
      integrandll = (exp(x**2))

      end


!!!!!!!!!!!!!!!!!!!!!!!  function for cll2  !!!!!!!!!!!!!!!!!!!!!!!!!!!
! function : func2
      complex*16 function func2(q, V0, mu, b)
      complex*16 iunit
      real(8) q,V0,mu,b
      complex*16 k
      iunit = (0.d0, 1.d0)

      if (q**2 - 2.d0*mu*V0 < 0) then
       k = iunit*sqrt(-(q**2 - 2.d0*mu*V0))
      else 
       k = sqrt(q**2 - 2.d0*mu*V0)
      endif

      !k = csqrt(dcmplx(q**2 - 2.d0*mu*V0))

      
      func2 = 1.d0/((k/tan(k*b)/tan(q*b) + q)/
     $            (1.d0/tan(q*b) - k/q/tan(k*b)) - iunit*q)
      
      write(12,*) k

      end
