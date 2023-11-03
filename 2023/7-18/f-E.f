! 散乱長を複素へ  
      program plotf
! variables
      complex*16 Epole        ! pole
      complex*16 kpole        ! pole
      real(8) k               ! momenta
      complex*16 f            ! scattering amplitude
          
      real(8) h               ! bin
      real(8) re, E, MeVfm, mu
      complex*16 a0
      integer i               ! for r loop
      complex*16 iunit

      iunit = (0.d0, 1.d0)



! input
      !Epole = (50.d0, -10.d0)                  ! MeV
      Epole = (6.98d0, -6.d0)             ! ALICE MeV
      MeVfm = 197.d0
      mu = 470.d0              !!!!!!!! Mev !!!!!!!!!!
      kpole = cdsqrt( dcmplx(2.d0*mu*Epole) )   ! MeV
      re = (1.d0/dimag(kpole))        ! 1/MeV

     
      a0 = 2.d0*re/((re*kpole - iunit)**2 + 1.d0)   ! 1/MeV


      write(*,*) 'a0:' , a0*MeVfm, 're:', re*MeVfm
      write(*,*) 're:', re*MeVfm
      write(*,*) 'kpole', kpole
      write(*,*) 'end!'



      end