      program swwf2

      real(8) x,y,z,f3,r,l

      x = 1.d0
      y = 1.d0
      z = 2.d0
      r = 1.d0
      l = 1.d0

      write(*,*) f3(x,y,z,r,l)

      end


      ! function : 
      real(8) function f1(x,y,z)
      real(8) x,y,z
      f1 = 2.d0*x

      end

      ! function : 
      real(8) function f2(x,y,z,r)
      real(8) x,y,r,f1,z
      f2 = 3.d0*f1(x,y,z)*r

      end

      ! function : 
      real(8) function f3(x,y,z,r,l)
      real(8) l
      real(8) f2,x,y,z,r
      f3 = 4.d0*f2(x,y,z,r)*l

      end