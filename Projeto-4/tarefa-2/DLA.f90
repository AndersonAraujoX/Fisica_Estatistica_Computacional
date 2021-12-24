program QC
  real*8 :: somax,somax2,somay,somay2,mediax,mediax2,mediay,mediay2,mediav,delta
  integer*8::a,b,be,n,x,y,irr
  integer,dimension(5)::ipx,ipy
  integer, dimension(10000,10000)::frac,frac2
  open(10,file="bebadoh.dat",status="replace")
  write(*,*)"digite a quantidade de bebados"
  read(*,*)be
  write(*,*)"digite a quantidade de passos"
  read(*,*)n
  write(*,*)"digite o tamanho do mapa"
  read(*,*)l
  !zerar as variavéis para caso o código já foi rodado outro vez
  ipx(1)=1
  ipx(2)=-1
  ipx(3)=0
  ipx(4)=0
  ipy(1)=0
  ipy(2)=0
  ipy(3)=1
  ipy(4)=-1
  pi=acos(-1)
  do j=1,l!zerando a matriz
    do i=1,l
      frac(i,j)=0
    enddo
  enddo
  !do  que ira realizar a movimentação do numero de bebados escolhidos pelo usuario
  do b=1,be
    !gerando a coordenada aleatória
    r=5+r0
  	x=r*cos(2*pi*rand())+l/2
    y=r*sin(2*pi*rand())+l/2
    !do para fazer contagem de passos do bebados nos 4 sentidos
  	do while(9>3)
      irr=4*rand()+1
      !condições para ver qual caminho bebados vão fazer
      x=x+ipx(irr)
      y=y+ipy(irr)
      if (frac(x+1,y)=1 .or. frac(x-1,y)=1 .or. frac(x,y+1)=1 .or. frac(x,y-1)=1)then
        frac(x,y)=1!quando a particula encontra o agregado
        exit
      endif
      if((x**2+y**2)**(0.5)>1.5*r)!verificar se a particula foi para longe 
        exit
      endif
    enddo
    if((x**2+y**2)**(0.5)>r0 .and. frac(x,y)==1) then!verificar se o novo agregado e a particula mais longe
      r0=(x**2+y**2)**(0.5)
    endif
  enddo
  do i=1,l!salvando os dados em um arquivo
      write(1,*)(frac(a,i),a=1,l)
  enddo
  close(10)
end program
