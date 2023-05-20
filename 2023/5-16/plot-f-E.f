      program plotf0
! variables
      complex*16 E         ! energy
      complex*16 k         ! momenta
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
      h = 0.1d0

      do i = 1, 100                                              ! for real

         do j = 1, 100                                           ! for imag
            realE = i*h
            imagE = j*h
            E = cmplx(realE, imagE)
            k = cdsqrt( dcmplx(2.d0*mu*E) )                         ! k[正]


            ! reonance condition for k. calcuration a0 and re.
            if (dreal(k) > 0 .and. dimag(k) < 0) then
               a0 = (dreal(k)**2 + dimag(k)**2)/(2.d0*dimag(k))     !mev^-1
               re = 1.d0/dimag(k)                                   !mev^-1
            else 
               a0 = (dreal(-k)**2 + dimag(k)**2)/(2.d0*dimag(k))    !mev^-1 ,第三象限のkの時は虚軸対称のk（第四象限にあるkを採用）
               re = 1.d0/dimag(k)                                   !mev^-1
               realk = dreal(k)
               imagk = dimag(k)
               k = cmplx(-realk, imagk)
            endif


            ! plot
            f = func(k, a0, re)
            write(11,*) realE, dreal(f)
            write(12,*) imagE, dimag(f)


         enddo

      enddo



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