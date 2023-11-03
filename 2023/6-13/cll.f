      program cll
! 概要：式(42)について、横軸kでプロット。[reとa0はEpole（入力）によって決定される。ソースサイズR、次元はa0[fm],k[MeV]]

! variables
      complex*16 Epole        ! pole
      complex*16 kpole        ! pole
      real(8) k               ! momenta
      complex*16 f            ! scattering amplitude
      real(8) Iint            ! integration
      real(8) absf_sq         ! |f|^2
           
      real(8) hk              ! bin
      real(8) a0, re, MeVfm, mu, R, x
      real(8) c1, c2, c3            ! cll = 1 + c1 + c2 + c3
      real(8) :: pi=4.d0*atan(1.d0)
      integer i ,j ,n            ! 
! function
      complex*16 func
      real(8) integrand


! file
      open(11,file="R5-50.dat") 


! input
      Epole = (50.d0, -10.d0)                     ! MeV
      !Epole = (6.98d0, -6.d0)                   ! ALICE MeV
      MeVfm = 197.d0
      R = 2.d0/MeVfm
      mu = 342.d0                               ! Mev
      kpole = cdsqrt( dcmplx(2.d0*mu*Epole) )   ! MeV
      hk = 0.1d0
      n = 4000

! calculate a0 and re
      a0 = ((2.d0*dimag(kpole))/(dreal(kpole)**2 + dimag(kpole)**2))   ! 1/MeV

      re = (1.d0/dimag(kpole))                                         ! 1/MeV
      !a0 = -0.3d0/MeVfm
      !re = 0.d0
! output  [0<k<400]  !MeV
      do j = 1, n
            Iint = 0.d0
            k = j*hk        ! Mev
            hx = (2.d0*k*R)/n

            ! integration
            do i = 1, n
               x = i*hx
               Iint = Iint + (integrand(x)
     $                     + integrand(x - hx))*hx/2.d0
            enddo

            f = func(k, a0, re)

            ! c1
            absf_sq = dreal(f)**2 + dimag(f)**2
            c1 = absf_sq/(2.d0*R**2)*(1.d0 - (re/R)/(2.d0*sqrt(pi)))

            ! c2
            c2 = 2.d0*dreal(f)/(sqrt(pi)*R)*Iint/(2.d0*k*R)
     $       *exp(-(2.d0*k*R)**2)

            ! c3
            c3 = -dimag(f)/R*(1.d0 - exp(-(2.d0*k*R)**2))/(2.d0*k*R)

            write(11,*) k, 1+c1+c2+c3
            !write(11,*) k, 1+c1+c2+c3, 1+c1, 1+c2, 1+c3

      enddo

      write(*,*) 'kpole' , dreal(kpole), dimag(kpole)
      write(*,*) 'a0:' , a0*MeVfm, 're:', re*MeVfm
      write(*,*) 'end!'

      close(11)


      end



! function : func
      complex*16 function func(k, a0, re)
      complex*16 iunit
      real(8) k 
      real(8) a0, re

      iunit = (0.d0, 1.d0)
      
      func = 1.d0/((-1.d0/a0) + (re/2.d0)*(k**2) - (iunit*k))

      end


! function : integrand
      real(8) function integrand(x)
      real(8) x
      integrand = (exp(x**2))

      end