program FT
  implicit real*8 (a-h,o-z)
  real*8, dimension(100000) :: coef
  real*8,dimension(6)::dt,a1,a2,w1,w2
  real*8::imag1
  character::nome(18)*23
  real*4:: t1,delta!para aceitar o secnds
  data nome/"saida1-a-11371311.dat","saida2-a-11371311.dat","saida3-a-11371311.dat","saida4-a-11371311.dat",&!os primeiros 6 vetores estão guardando os coeficiente de fourier
  "saida5-a-11371311.dat","saida6-a-11371311.dat","saida7-a-11371311.dat","saida8-a-11371311.dat",&!os 6 seguintes vetores estao armazenando os valres reais da transformada de fourier
  "saida9-a-11371311.dat","saida10-a-11371311.dat","saida11-a-11371311.dat","saida12-a-11371311.dat",&!os ultimos 6 arquivos estao armazenando os valores imaginario da transformada de fourier
  "saida13-a-11371311.dat","saida14-a-11371311.dat","saida15-a-11371311.dat","saida16-a-11371311.dat",&
  "saida17-a-11371311.dat","saida18-a-11371311.dat"/
  !valor de pi
  t1 = secnds(0.0)
  pi=dacos(-1d0)
  N=200
  !coeficientes de fourier
  do l=1,6

    open((l+10),file=nome(l))
    open((l+16),file=nome(l+6))
    open((l+22),file=nome(l+12))
    dt = (/0.04d0,0.04d0,0.4d0,0.4d0,0.04d0,0.04d0/)
    a1 = (/2d0,3d0,2d0,3d0,2d0,2d0/)
    a2 = (/4d0,2d0,4d0,2d0,4d0,4d0/)
    w1 = (/4d0*pi,4d0*pi,4d0*pi,4d0*pi,4d0*pi,4.2d0*pi/)
    w2 = (/2.5d0*pi,2.5d0*pi,0.2d0*pi,0.2d0*pi,1.4d0*pi,1.4d0*pi/)

    do i=1,N

      t=dt(l)*i
      y=a1(l)*dcos(w1(l)*t)+a2(l)*dsin(w2(l)*t)
      coef(i)=y!salvando os coeficientes de fourier
      write((l+10),*)t,y

    enddo
    !transformada de fourier
    do k=1,N

        real1=0
        imag1=0
        !soma de fourier

      do j=1,N

          real1=real1+coef(j)*dcos(2d0*pi*j/N*k)
          imag1=imag1+coef(j)*dsin(2d0*pi*j/N*k)

      enddo

        !saida de dados
        f=k/(N*dt(l))
        write((l+16),*)f,real1
        write((l+22),*)f,imag1

    enddo

  enddo

  delta = secnds(t1)
  write(*,*)(delta)
end program
