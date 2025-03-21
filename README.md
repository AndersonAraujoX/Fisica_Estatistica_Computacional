# Análise Espectral por Transformadas de Fourier

Este projeto explora a análise espectral através das Transformadas de Fourier, decompondo funções temporais em frequências e investigando a relação entre sinais e suas composições de ondas. 

## Transformada de Fourier

A Transformada de Fourier decompõe uma função do tempo no domínio da frequência. Ela transforma uma função do tempo em uma função de valor complexo da frequência, onde o valor absoluto representa a soma das frequências presentes na função original, e o argumento complexo representa o deslocamento de fase da função trigonométrica naquela frequência. [cite: 5, 6]

### Transformada Discreta de Fourier

A Transformada Discreta de Fourier é utilizada para aplicações computacionais. 

### Código

O código em Fortran é utilizado para calcular a Transformada de Fourier de um sinal discreto. 

### Parte 2

Nesta parte do projeto, os coeficientes de Fourier de uma função são calculados.  A função utilizada é do tipo:

$f(t) = a \cos(\omega_1 t) + b \sin(\omega_2 t)$ 

Os valores de *a*, *b*, $\omega_1$, $\omega_2$ e Δt são variados para analisar o comportamento da transformada. 

### Parte 3

Os dados obtidos na Parte 2 são utilizados como coeficientes de Fourier para analisar as frequências das ondas.  A transformada de Fourier é aplicada a diferentes ondas, e as frequências resultantes são comparadas com as frequências das ondas originais. [cite: 25, 26, 27, 28]

## Transformada Inversa de Fourier

A Transformada Inversa de Fourier é utilizada para retornar ao sinal original a partir dos coeficientes de Fourier. 

### Código

O código em Fortran implementa a Transformada Inversa de Fourier. 

### Parte 4

A Transformada Inversa de Fourier é aplicada para retornar ao sinal original, demonstrando a eficácia da transformação. 

## Parte 5

O tempo de processamento do programa é analisado em função da quantidade de dados, mostrando um aumento exponencial da complexidade.

# Equações de Ondas - II

Este projeto explora as equações de ondas, analisando o espectro potencial de uma função de onda Gaussiana e o comportamento de ondas em diferentes condições. 

## Teoria e Código

### Teoria

O projeto aborda o comportamento de ondas, incluindo ondas confinadas e a análise de modos de vibração. 

### Projeto

O espectro potencial de uma função de onda Gaussiana é analisado utilizando a Transformada de Fourier.

### Código

O código em Fortran é utilizado para gerar o movimento da Gaussiana e calcular a Transformada de Fourier. 

## Parte A

As frequências presentes no espectro de potências são analisadas. 

## Parte B

O deslocamento da origem da onda Gaussiana e suas influências nos modos são estudados. 

## Parte C

Os modos presentes são analisados, observando a relação entre frequências e amplitudes. 

## Parte D

O padrão de frequências e as amplitudes dos modos são investigados.

## Resultados

Os resultados obtidos demonstram a relação entre os modos e a função de onda, e a aplicação da Série de Fourier. 

## Parte E

O comportamento dos modos com extremidades livres é analisado. 

# Modelo de Crescimento

Este projeto explora modelos de crescimento, utilizando autômatos celulares e analisando o crescimento de estruturas como tumores e fractais. 

## Tarefa-1

### Teoria

O projeto utiliza autômatos celulares com regras de evolução que dependem das três vizinhanças.

### Resultados

Diferentes regras são aplicadas para observar os padrões de crescimento resultantes.

### Código

O código em Fortran implementa as regras de evolução do autômato celular. 

## Tarefa-2

### Teoria

O projeto explora modelos de crescimento aleatórios, como o Modelo de Eden e o Modelo DLA (Diffusion Limited Aggregation). 

### Resultado

Os resultados obtidos demonstram o crescimento de fractais e a análise de sua dimensão. 

### Código

O código em Fortran simula o crescimento de fractais utilizando o Modelo DLA.

## Tarefa-3

### Resultados

A dimensão fractal de um fractal 3D é analisada.

### Código

O código em Fortran é adaptado para simular o crescimento de fractais em 3D. 

## Tarefa-4

### Resultados

O crescimento de uma estrutura a partir de uma reta é simulado. 

### Código

O código em Fortran simula o crescimento a partir de uma reta. 

## Tarefa-5

### Resultados

O movimento de um agregado em um meio com partículas é simulado. 

### Código

O código em Fortran simula o movimento do agregado e a captura de partículas. 

# Dinâmica Molecular

Este projeto explora a Dinâmica Molecular, um método de simulação computacional para estudar o movimento de átomos e moléculas.

## Introdução

A Dinâmica Molecular simula o movimento de átomos e moléculas, considerando o potencial de interação e as equações de movimento. 

## Tarefa-A

O movimento de partículas em um sistema é simulado. 

### Código

O código em Fortran implementa a simulação da dinâmica molecular.

## Tarefa-B

A distribuição de Maxwell-Boltzmann é analisada através da simulação.

### Código

O código em Fortran realiza a simulação e gera os gráficos da distribuição de velocidade. 

## Tarefa-C

A distribuição de Maxwell-Boltzmann é analisada com uma distribuição inicial de velocidade diferente. 

### Código

O código em Fortran implementa a simulação com a nova distribuição de velocidade. 

## Tarefa-D

A temperatura do sistema é calculada a partir da energia cinética média das partículas. 

### Código

O código em Fortran calcula a energia cinética e a temperatura do sistema. 

## Tarefa-E

A simulação é realizada em um sistema mais denso para observar o comportamento das partículas. 

### Código

O código em Fortran simula o sistema denso. 

## Tarefa-F

A transição de fase de um sistema cristalino para líquido é simulada através do aumento da velocidade das partículas. 

### Código

O código em Fortran simula a transição de fase. 
