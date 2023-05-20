      program plotf
! variables
      complex*16 Epole        ! pole
      complex*16 kpole        ! pole
      real(8) k            ! momenta
      complex*16 f         ! scattering amplitude
           
      real(8) h            ! bin
      integer i            ! for r loop
      real(8) mu ,mevfm, a0, re, E
! function
      complex*16 func


! file
      open(11,file="plot-realf-out.dat") 
      open(12,file="plot-imagf-out.dat") 


! input
      mevfm = 197.32698d0
      mu = 470.d0                                                 ! meV
      Epole = (2.d0, -1.d0)
      
      kpole = cdsqrt( dcmplx(2.d0*Epole) ) 

     
      a0 = (dreal(kpole)**2 + dimag(kpole)**2)/(2.d0*dimag(kpole))

      re = 1.d0/dimag(kpole)

! output
      h = 0.1d0

      do i = 1, 100

            E = i*h        ! mev

            k = sqrt(2.d0*E)

            ! plot
            f = func(k, a0, re)
            write(11,*) E, dreal(f)
            write(12,*) E, dimag(f)

      enddo


      write(*,*) a0, re
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