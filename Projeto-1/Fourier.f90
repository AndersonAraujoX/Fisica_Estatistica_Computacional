program Qb
  real, dimension(210) :: valor
  open(1,file="saida1-b-11371311.dat",status="replace")
  open(2,file="saida2-b-11371311.dat",status="replace")
  open(3,file="saida3-b-11371311.dat",status="replace")
  open(4,file="saida4-b-11371311.dat",status="replace")
  !coeficientes de fourier
  !valor de pi
  pi=dacos(-1d0)
  do i=1,200
    t=0.04*i
    y=3*cos(4*pi*t)+2*sin(2.5*pi*t)
    valor(i)=y!salvando os coeficientes de fourier
    write(2,*)t,y
  enddo
  !transformada de fourier
  do k=0,199
    real1=0
    imag1=0
    !soma de fourier
    do j=0,199
      real1=real1+valor(1+j)*cos(2*pi*j*k/200)
      imag1=imag1+valor(1+j)*sin(2*pi*j*k/200)
    enddo
    !saida de dados
    write(1,*)k,real1
    write(*,*)k,real1
  enddo
end program
