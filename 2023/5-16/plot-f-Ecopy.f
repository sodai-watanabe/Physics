      program plotf
! variables
      complex*16 Epole        ! pole
      complex*16 kpole        ! pole
      real(8) k               ! momenta
      complex*16 f            ! scattering amplitude
           
      real(8) h               ! bin
      real(8) a0, re, E, MeVfm, mu
      integer i               ! for r loop
! function
      complex*16 func


! file
      open(11,file="plot-realf-out.dat") 
      open(12,file="plot-imagf-out.dat") 


! input
      Epole = (30.d0, -30.d0)                  ! MeV
      MeVfm = 197.d0
      mu = 470.d0                               ! Mev
      kpole = cdsqrt( dcmplx(2.d0*mu*Epole) )   ! MeV

     
      a0 = ((2.d0*dimag(kpole))/(dreal(kpole)**2 + dimag(kpole)**2))   ! 1/MeV

      re = (1.d0/dimag(kpole))        ! 1/MeV

! output
      h = 0.1d0          ! Mev    

      do i = 1, 1000

            E = i*h        ! Mev

            k = sqrt(2.d0*mu*E)      ! Mev

            ! plot
            f = func(k, a0, re)
            write(11,*) E, dreal(f)*MeVfm
            write(12,*) E, dimag(f)*MeVfm

      enddo

      write(*,*) 'kpole' , dreal(kpole), dimag(kpole)
      write(*,*) 'a0:' , a0*MeVfm, 're:', re*MeVfm
      write(*,*) 'end!'

      close(11)
      close(12)


      end



! function
      complex*16 function func(k, a0, re)
      complex*16 iunit
      real(8) k 
      real(8) a0, re

      iunit = (0.d0, 1.d0)
      
      func = 1.d0/((-1.d0/a0) + (re/2.d0)*(k**2) - (iunit*k))


      end