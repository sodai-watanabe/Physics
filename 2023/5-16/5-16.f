      program EtoAandRE
!variables
      COMPLEX*16 E         ! energy
      COMPLEX*16 k         ! momenta
      REAL(8) mu,a0,re,mevfm

!input 
      mu = 940.d0          !mev
      E = (5.d0, -8.d0)    !mev
      mevfm = 197.32698d0

! calcurate positive momenta.
      k = cdsqrt( dcmplx(2.d0*mu*E) )                         !mev kは本来二つだけど片方だけ(正）だけとる。

! reonance condition for k. calcuration a0 and re.
      if (dreal(k) > 0 .and. dimag(k) < 0) then
         a0 = (dreal(k)**2 + dimag(k)**2)/(2.d0*dimag(k))     !mev^-1
         re = 1.d0/dimag(k)                                   !mev^-1

      else 
         a0 = (dreal(-k)**2 + dimag(k)**2)/(2.d0*dimag(k))  !mev^-1 ,第三象限のkの時は虚軸対称のk（第四象限にあるk）
         re = 1.d0/dimag(k)                                  !mev^-1
      endif
! output
      write(*,*)  'a0[fm]', a0*mevfm
      write(*,*)  're[fm]', re*mevfm

      end


