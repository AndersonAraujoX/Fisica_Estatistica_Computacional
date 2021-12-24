program Qb
  open(1,file="saida1-b-11371311.dat",status="replace")
  open(2,file="saida2-b-11371311.dat",status="replace")
  open(3,file="saida3-b-11371311.dat",status="replace")
  open(4,file="saida4-b-11371311.dat",status="replace")
  !valor de pi
  pi=dacos(-1d0)
  t=0.04
  do i=1,200
    y=2*cos(4*pi*t)+4*sin(2.5*pi*t)
    t=0.04*i
    write(1,*)y
  enddo
  end program
  !function f(x)
   !] real*8::x,f
   ! f=dexp(x/2.0)*dcos(dacos(-1d0)*x)
  !end function