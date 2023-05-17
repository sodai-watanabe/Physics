      program resonance

! variables
      complex*16 E          ! energy
      complex*16 k          ! momenta
      real(8) a0   ! length
      real(8) re   ! effective range
            
      real(8) mu, mevfm, d  !  

! file 
      open(11,file="5-9_in.dat")        
      open(12,file="5-9_out.dat")        


! input
      read(11,*) a0, re                   ! fm,fm
      mevfm = 197.32698d0
      a0 = a0/mevfm                       ! 1/mev
      re = re/mevfm                       ! 1/mev
      mu = 940.d0                         ! mev
      d = -1.d0 + (2.d0*re)/a0
      k = dcmplx(-sqrt(d)/re,1.d0/re)     ! Real:mev, Imag:mev
      E = (k**2)/(2.d0*mu)                ! mev
      
      write(12,*) dreal(k), dimag(k)
      write(12,*) dreal(E), dimag(E)
      
      write(*,*) 'end!'  ! successful execution

      close(11)
      close(12)

      end

! function
      
      