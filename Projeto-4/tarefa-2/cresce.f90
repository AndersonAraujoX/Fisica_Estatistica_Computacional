program analise
  implicit integer*16(a-h,o-z)
  integer*16::soma,dois
  integer, dimension(10000,10000)::frac1,frac2
  l=50
  do j=1,l
    do i=1,l
      frac1(i,j)=0
      frac2(i,j)=0
    enddo
  enddo
  frac1(l/2,l/2)=1
  frac2(l/2,l/2)=1
do k=10,20!tempo
  do j=1,l!eixo y
    do i=1,l!eixo x
      if (frac1(i,j)==1 )then
        if(0==(i-1))then
          frac2(i+1,j)=1
          frac2(i,j+1)=1
          frac2(i,j-1)=1
        else if(0==(j-1))then
          frac2(i+1,j)=1
          frac2(i-1,j)=1
          frac2(i,j+1)=1
        else if((l+1)==(j+1))then
          frac2(i+1,j)=1
          frac2(i-1,j)=1
          frac2(i,j-1)=1
        else if((l+1)==(i+1))then
          frac2(i-1,j)=1
          frac2(i,j+1)=1
          frac2(i,j-1)=1
        else
          frac2(i+1,j)=1
          frac2(i-1,j)=1
          frac2(i,j+1)=1
          frac2(i,j-1)=1
        endif
      endif
    enddo
  enddo
  do j=1,l
    do i=1,l
      frac1(i,j)=frac2(i,j)
    enddo
    write(k,*)(frac2(a,j),a=1,l)
  enddo
enddo
end program
