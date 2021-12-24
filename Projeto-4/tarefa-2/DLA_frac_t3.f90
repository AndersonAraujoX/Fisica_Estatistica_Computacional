program QC
  integer*8::a,b,be,n,x,y,z,irr
  integer,dimension(7)::ipx,ipy,ipz
  integer, dimension(1000,1000,1000)::frac
  open(10,file="bebadoh.dat",status="replace")
  write(*,*)"digite a quantidade de bebados"
  read(*,*)be
  write(*,*)"digite o tamanho do mapa"
  read(*,*)l
  !zerar as variavéis para caso o código já foi rodado outro vez
  r0=0
  b=1
  !vetores para movimento aleatorio
  ipx(1)=1
  ipx(2)=-1
  ipx(3)=0
  ipx(4)=0
  ipx(5)=0
  ipx(6)=0

  ipy(1)=0
  ipy(2)=0
  ipy(3)=1
  ipy(4)=-1
  ipy(5)=0
  ipy(6)=0

  ipz(1)=0
  ipz(2)=0
  ipz(3)=0
  ipz(4)=0
  ipz(5)=1
  ipz(6)=-1

  pi=acos(-1d0)

  do j=1,l!zerando a matriz
    do i=1,l
      do k=1,l
        frac(i,j,k)=0
      enddo
    enddo
  enddo
  frac(l/2,l/2,l/2)=1

  !do  que ira realizar a movimentação do numero de bebados escolhidos pelo usuario
  do while(b<=be)
    !gerando a coordenada aleatória através dos angulos
    r=5+r0
    teta=rand()
    phi=rand()
  	x=r*cos(2*pi*teta)*sin(2*pi*phi)+l/2
    y=r*sin(2*pi*teta)*sin(2*pi*phi)+l/2
    z=r*cos(2*pi*phi)+l/2
    !do para fazer contagem de passos do bebados nos 4 sentidos

  	do while(9>3)
      !condições para ver qual caminho bebados vão fazer
      irr=6*rand()+1
      x=x+ipx(irr)
      y=y+ipy(irr)
      z=z+ipz(irr)
      if(x>0 .and. y>0 .and. z>0)then
        if (frac(x+1,y,z)==1 .or. frac(x-1,y,z)==1 .or. frac(x,y+1,z)==1 .or. frac(x,y-1,z)==1 )then
          frac(x,y,z)=1!quando a particula encontra o agregado
          b=b+1
          exit
        else if (frac(x,y,z+1)==1 .or. frac(x,y,z-1)==1 )then
          frac(x,y,z)=1!quando a particula encontra o agregado
          b=b+1
          exit
        endif
      endif


      if(((x-l/2)**2+(y-l/2)**2+(z-l/2)**2)**(0.5)>=1.5*r .or. x<0 .or. y<0 .or. z<0)then!verificar se a particula foi para longe 
        x=1!para não dar erro
        y=1
        z=1
        exit
      endif

    enddo
    if(((x-l/2)**2+(y-l/2)**2+(z-l/2)**2)**(0.5)>r0 .and. frac(x,y,z)==1) then!verificar se o novo agregado e a particula mais longe
      r0=((x-l/2)**2+(y-l/2)**2+(z-l/2)**2)**(0.5)
    endif
    !enviando os dados para um arquivo
    write(3,*)r,b

  enddo
end program
