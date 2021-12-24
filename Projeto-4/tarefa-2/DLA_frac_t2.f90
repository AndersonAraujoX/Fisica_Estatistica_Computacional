program t2
  integer*8::a,b,be,n,x,y,irr
  integer,dimension(5)::ipx,ipy
  integer, dimension(10000,10000)::frac
  write(*,*)"digite a quantidade de bebados"
  read(*,*)be
  write(*,*)"digite o tamanho do mapa"
  read(*,*)l
  !zerar as variavéis para caso o código já foi rodado outro vez
  r0=0
  b=1
  !vetores de movimento
  ipx(1)=1
  ipx(2)=-1
  ipx(3)=0
  ipx(4)=0
  
  ipy(1)=0
  ipy(2)=0
  ipy(3)=1
  ipy(4)=-1
  pi=acos(-1d0)
  do j=1,l!zerando a matriz
    do i=1,l
      frac(i,j)=0
    enddo
  enddo
  !colocando particula na origem (0,0) é (l/2,l/2)
  frac(l/2,l/2)=1
  !do  que ira realizar a movimentação do numero de bebados escolhidos pelo usuario
  do while(b<=be)!particulas agregados

    !gerando a coordenada aleatória
    r=5+r0
    teta=rand()
  	x=r*cos(2*pi*teta)+l/2
    y=r*sin(2*pi*teta)+l/2

    !do para fazer contagem de passos do bebados nos 4 sentidos
  	do while(9>3)

      !condições para ver qual caminho bebados vão fazer
      irr=4*rand()+1
      x=x+ipx(irr)
      y=y+ipy(irr)

      if(x>0 .and. y>0)then
        if ((frac(x+1,y)+frac(x-1,y)+ frac(x,y+1)+frac(x,y-1))>=1)then!procurando uma particula
          frac(x,y)=1!quando a particula encontra o agregado
          b=b+1
          exit
        endif
      endif

      if(((x-l/2)**2+(y-l/2)**2)**(0.5)>=1.5*r .or. x<0 .or. y<0)then!verificar se a particula foi para longe 
        x=1!para não dar erro quando for no if do raio
        y=1
        exit
      endif
    enddo

    if(((x-l/2)**2+(y-l/2)**2)**(0.5)>r0 .and. frac(x,y)==1) then!verificar se o novo agregado e a particula mais longe
      r0=((x-l/2)**2+(y-l/2)**2)**(0.5)
    endif
    write(2,*)r,b!salvando o raio e a quantidade de particulas
  enddo

  do i=1,l!salvando os dados em um arquivo
      write(1,*)(frac(a,i),a=1,l)
  enddo

end program
