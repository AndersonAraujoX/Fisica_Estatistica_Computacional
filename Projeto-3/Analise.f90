program analise
  implicit real*8(a-h,o-z)
  real*8 ::imag1
  real*8, dimension(50000) :: valor
  real*8, dimension(11000,20010)::y
!condições iniciais
!======onda=========
write(*,*)"Digite o valor que vai multiplicar L"
read(*,*)x
write(*,*)"Digite 1 para a extremidade seja livre, 0 para extremidade fixa"
read(*,*)borda
L=1.0d0
r=1.0d0
dt=0.001d0/300d0
do i=2,1000!colocando todos os pontos y(x,0)
    y(i,2)=exp(-(i*0.001d0-L*x)**2/(L/30.0d0)**2)!
    y(i,1)=y(i,2)
enddo
    r=1
do n=2,10000
    do i=2,1000
    if(borda==0)then
     y(1000,n)=0
     y(1000,n+1)=0
    endif
     y(2,n)=0
     y(2,n+1)=0
     if(1001==i+1)then!para caso valor 1+i seja no contorno 1001, pegar o valor anterior
            y(i+1,n)=y(i,n)
            y(i,n+1)=2.0d0*(1.0d0-r**2)*y(i,n)+(r**2.0d0)*(y(i+1,n)+y(i-1,n))-y(i,n-1)
      else if(1==i-1)then!para caso valor i-1 seja no contorno 1001, pegar o valor anterior
            y(i-1,n)=y(i,n)
            y(i,n+1)=2.0d0*(1.0d0-r**2)*y(i,n)+(r**2.0d0)*(y(i+1,n)+y(i-1,n))-y(i,n-1)
      else
            y(i,n+1)=2.0d0*(1.0d0-r**2)*y(i,n)+(r**2.0d0)*(y(i+1,n)+y(i-1,n))-y(i,n-1)
      end if
    enddo
enddo
do n=1,10000!passar tudo para um vetor
    valor(n)=y(250,n)
    write(2,*)n,y(250,n)
enddo
!======transformada de fourier=====
pi=dacos(-1.0d0)
  do k=1,10000
    real1=0
    imag1=0
    !soma de fourier
    do j=1,10000
      real1=real1+valor(j)*dcos(2d0*pi*j*k/10000d0)
      imag1=imag1+valor(j)*dsin(2d0*pi*j*k/10000d0)
    enddo
    p=(real1)**2+(imag1)**2
    !saida de dados
    write(4,*)k/(10000*dt),p
    write(1,*)k/(10000*dt),real1
    write(3,*)k/(10000*dt),imag1
  enddo
end program
