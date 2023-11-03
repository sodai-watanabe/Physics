! 複素エネルギー平面に散乱長a0または有効レンジreを3Dプロット。
! a0かreどちらか見たい方を残し、片方はコメントアウトして実行してください。


      program a03d
! variables
      complex*16 Epole        ! pole
      complex*16 kpole        ! pole
      complex*16 iunit        ! i
      real(8) h               ! bin
      real(8) a0, re, MeVfm, mu, realE, imagE
      integer i, j             ! for r loop

      iunit = (0.d0, 1.d0)

! file
      open(11,file="6-20.dat") 


! input
      MeVfm = 197.d0
      mu = 341.9d0        ! Mev
     
! output
      h = 1.d0          ! Mev    

      do i = 1, 100

            realE = i*h        ! Mev

            do j = 1, 100

                  imagE = -j*h       ! Mev

                  Epole = realE + imagE*iunit
                  kpole = cdsqrt( dcmplx(2.d0*mu*Epole) )

                  a0 = ((2.d0*dimag(kpole))/(dreal(kpole)**2
     $                  + dimag(kpole)**2))
                  re = (1.d0/dimag(kpole))

                  write(11,*) realE, imagE,re*MeVfm
                  !write(11,*) realE, imagE, a0*MeVfm,re*MeVfm
            
            enddo

            write(11,*) " "

      enddo

      write(*,*) 'end!'

      close(11)


      end