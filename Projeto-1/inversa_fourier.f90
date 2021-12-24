program FIT
  implicit real*8 (a-h,o-z)
   real*8, dimension(200) :: valorR,valorI
   real*4:: t1,delta!para aceitar o secnds
  !coeficientes de fourier
  !valor de pi
  open(1,file='saida5-a-11371311.dat',status='old')
  open(2,file='saida9-a-11371311.dat',status='old')
  open(3,file='saida19-a-11371311.dat',status='replace')
  open(4,file='saida20-a-11371311.dat',status='replace')
  t1=0
  t1 = secnds(0.0)
  pi=dacos(-1d0)
  N=200
  do i=1,N
   read(1,*)p,valorR(i)
   read(2,*)h,valorI(i)
  enddo
  close(1)
  close(2)
  !transformada inversa de fourier
    do k=1,N
        real1=0
        imag1=0
        !soma de fourier
      do j=1,N
          real1=real1+(valorR(j)*dcos(2*pi*j/N*k)-valorI(j)*dsin(-2*pi*j/N*k))
          imag1=imag1+(valorR(j)*dsin(-2*pi*j/N*k)+valorI(j)*dcos(2*pi*j/N*k))
      enddo
        !saida de dados
        t=k*0.04
        write(3,*)t,real1/N
        write(4,*)t,imag1/N
    enddo
  close(1)
  close(2)
  delta = secnds(t1)
  write(*,*)(delta)
end program
