program analise
  implicit integer*16(a-h,o-z)
  integer*16::soma,dois
  !separando em dois vetores um para manter as condições até processar todos os automato
  !outro para salvar as alterações
  integer, dimension(10000) ::celulas1,celulas2
  cem=100
  l=10
  j=0
  dois=2
  soma=0
  do i=1,1000! gerando os automatos aletoriamente
    if (rand()>=0.5)then 
      celulas1(i)=1
    else
      celulas1(i)=0
    endif
  enddo
  celulas1(1)=1
  do i=2,l
    celulas1(i)=0
  enddo
  do i=1,l!transformado em binário
      if (celulas1(i)==1)then
        soma=soma+dois**i
      endif
  enddo
    write(1,*)j,soma
    soma=0
!regra da epidemia
do j=1,5!do que irá contar o tempo
  do i=1,l!do que irá fazer a logica para regra da epidemia
    if (0==(i-1))then!condições para caso o chega na borda
      if (celulas1(l)+celulas1(i+1)==2) then
        celulas2(i)=1
      else if(celulas1(l)+celulas1(i+1)==1)  then
        celulas2(i)=1
      else if(celulas1(i)==1)then
        celulas2(i)=1
      else 
        celulas2(i)=0
      endif
    else if ((l+1)==(i+1))then!condições para caso o chege na borda
      if (celulas1(i-1)+celulas1(1)==2) then
        celulas2(i)=1
      else if(celulas1(i)==1)then
        celulas2(i)=1
      else if(celulas1(i-1)+celulas1(1)==1)  then
        celulas2(i)= 1
      else 
        celulas2(i)=0
      endif
    else
      if (celulas1(i-1)+celulas1(i+1)==2) then
        celulas2(i)=1
      else if(celulas1(i-1)+celulas1(i+1)==1)  then
        celulas2(i)= 1
      else if(celulas1(i)==1)then
        celulas2(i)=1
      else
        celulas2(i)=0
      endif
    endif
  enddo
    do i=1,l!passando todos os valores alterados para o vetor do tempo atual
      celulas1(i)=celulas2(i)
      write(*,*)celulas1(i)
    enddo
    do i=1,l!transformado em binário
      if (celulas1(i)==1)then
        soma=soma+dois**i
      endif
    enddo
    write(1,*)j,soma
    soma=0
enddo
end program
