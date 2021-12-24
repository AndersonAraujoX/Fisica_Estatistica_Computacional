program analise
  implicit integer*16(a-h,o-z)
  integer*16::soma,dois,aut
  !separando em dois vetores um para manter as condições até processar todos os automato
  !outro para salvar as alterações
  integer, dimension(10000) ::celulas1,celulas2
  write(*,*)"digite a quantidade de interaççoes"
  read(*,*)int
  write(*,*)'Digite a quantidade de automatos'
  read(*,*)l
  write(*,*)'Digite para qual modelo iremos analisar()'
  read(*,*)aut
  j=0
  dois=2
  soma=0
  !gerando o valor dos automatos iniciais
  if(aut==1)then
    do i=1,l!automatos aleatorios
      if (rand()>=0.5)then
        celulas1(i)=1
      else
        celulas1(i)=0
      endif
    enddo
  else if(aut==2)then
    do i=1,l!todos 0
      celulas1(i)=0
    enddo
  else if(aut==3)then
    do i=1,l!todos 1
      celulas1(i)=1
    enddo
  endif
  do i=1,l!transformado em binário
      if (celulas1(i)==1)then
        soma=soma+dois**i
      endif
  enddo
  !passando os dados para um arquivo
  write(2,*)(celulas1(a),a=1,l)
  write(1,*)j,soma
  soma=0

!regra da epidemia
do j=1,int!do que irá contar o tempo
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
    enddo

    do i=1,l!transformado em binário
      if (celulas1(i)==1)then
        soma=soma+dois**i
      endif
    enddo

    !passando os dados para um arquivo
    write(2,*)(celulas1(a),a=1,l)
    write(1,*)j,soma
    soma=0
enddo
end program
