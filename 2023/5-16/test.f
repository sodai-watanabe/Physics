      program plotf0
! variables
      complex*16 E         ! energy
      complex*16 k, k0      ! momenta
      complex*16 f         ! scattering amplitude
           
      double precision h   ! bin
      integer i, j         ! for r loop
      real(8) mu ,mevfm, a0, re, realE, imagE, realk, imagk

! function
      complex*16 func



! file
      open(11,file="plot-f(realE)-out.dat") 
      open(12,file="plot-f(imagE)-out.dat") 


! input
      mevfm = 197.32698d0
      mu = 470.d0                                                 ! meV


! output
       k0 = (1.d0, 0.d0)
       f = func(k0, 1.d0, 1.d0)
       write(*,*) f
      



      write(*,*) 'end!'

      close(11)
      close(12)


      end



! function
      complex*16 function func(k, a0, re)
      complex*16 k 
      complex*16 iunit
      real(8) a0, re

      iunit = (0.d0, 1.d0)
      
      func = 1.d0/((-1.d0/a0) + (re/2.d0)*(k**2) - (iunit*k))


      end