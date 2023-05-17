      program EtoAandRE
!variables
      COMPLEX*16 E         ! energy
      COMPLEX*16 k         ! momenta
      REAL(8) mu,a0,re

!input 
      mu = 940.d0          !mev
      E = (5.d0, -8.d0)

! calcurate positive momenta.
      k = cdsqrt( dcmplx(2.d0*mu*E) )

! reonance condition for k. calcuration a0 and re.
      if (dreal(k) > 0 .and. dimag(k) < 0 .and. 
     $       dimag(k) > -dreal(k)) then
         a0 = (dreal(k)**2 + dimag(k)**2)/(2.d0*dimag(k))
         re = 1.d0/dimag(k)

      else 
         a0 = (dreal(-k)**2 + dimag(-k)**2)/(2.d0*dimag(-k))
         re = 1.d0/dimag(-k)

      endif
! output
      write(*,*)  'a0', a0
      write(*,*)  're', re

      end


