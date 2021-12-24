program QC
  integer*8::a,b,c,be,n,x,y,irr
  integer,dimension(5)::ipx,ipy
  integer, dimension(10000,10000)::frac,fracm1,fracm2
  write(*,*)"digite a quantidade de bebados"
  read(*,*)be
  write(*,*)"digite o tamanho do mapa"
  read(*,*)l
  !zerar as variavéis para caso o código já foi rodado outro vez
  r0=0
  b=1
  entro=0
  do j=1,l!zerando a matriz
    do i=1,l
      if(rand()>=0.9)then
        frac(i,j)=1
      else
        frac(i,j)=0
      endif
    enddo
  enddo
  do j=1,l!zerando a matriz
    do i=1,l
        fracm1(i,j)=0
    enddo
  enddo
  fracm1(l/2,l/2)=2
   do i=1,l!salvando os dados em um arquivo
        write(1,*)(fracm1(a,i),a=1,l)
      enddo
 
  !do  que ira realizar a movimentação do numero de bebados escolhidos pelo usuario
  do while(b<=be)!particulas agregados
  
    !do para fazer contagem de passos do bebados nos 4 sentidos
  	do while(9>3)
      !condições para ver qual caminho bebados vão fazer

      ale=rand()
      if(ale<=0.25)then
         do j=1,l!reajustando o valores das matrizes
            do i=1,l
                fracm2(i+1,j)=fracm1(i,j)
            enddo
          enddo
      else if (0.25<ale .and. ale<=0.5)then
        do j=1,l!reajustando o valores das matrizes
            do i=1,l
                if(i-1>0)then!evitar e zero
                  fracm2(i-1,j)=fracm1(i,j)
                endif
            enddo
          enddo
      else if (0.5<ale .and. ale<=0.75)then
        do j=1,l!reajustando o valores das matrizes
            do i=1,l
                fracm2(i,j+1)=fracm1(i,j)
            enddo
          enddo
      else if (0.75<ale)then
        do j=1,l!reajustando o valores das matrizes
            do i=1,l
              if(j-1>0)then!evitar o zero
                fracm2(i,j-1)=fracm1(i,j)
              endif
            enddo
          enddo
      endif
      do j=1,l!repassando a matriz alterada para matriz original
          do i=1,l
            fracm1(i,j)=fracm2(i,j)
          enddo
      enddo
      do x=1,l
        do y=1,l
          if((x-1)*(y-1)>0)then
            if ((frac(x+1,y)==1 .or. frac(x-1,y)==1 .or. frac(x,y+1)==1 .or. frac(x,y-1)==1) .and. fracm1(x,y)==2)then!procurando uma particula
              entro=1
              if(frac(x+1,y)==1 .and. fracm1(x,y)==2)then
                fracm1(x+1,y)=2!quando a particula encontra o agregado
                frac(x+1,y)=0
                b=b+1
              endif

              if(x-1>0)then
                if(frac(x-1,y)==1 .and. fracm1(x,y)==2)then
                  fracm1(x-1,y)=2!quando a particula encontra o agregado
                  frac(x-1,y)=0
                  b=b+1
                endif
              endif

              if(frac(x,y+1)==1 .and. fracm1(x,y)==2)then
                fracm1(x,y+1)=2!quando a particula encontra o agregado
                frac(x,y+1)=0
                b=b+1
              endif

              if(y-1>0)then
                if(frac(x,y-1)==1 .and. fracm1(x,y)==2)then
                  fracm1(x,y-1)=2!quando a particula encontra o agregado
                  frac(x,y-1)=0
                  b=b+1
                endif
              endif

            endif
          endif
        enddo
      enddo


      if(entro==1)then!check
        entro=0
        exit
      endif


    enddo
  
  enddo
  do i=1,l!salvando os dados em um arquivo
      write(7,*)(frac(a,i),a=1,l)
      write(8,*)(fracm1(a,i),a=1,l)
      write(9,*)(fracm2(a,i),a=1,l)
  enddo
end program
