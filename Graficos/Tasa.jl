#### Inicialización de librerías  y seteo de directorio madre#####

cd("/home/jesus/Documentos/MEcon/Tesis-Posibles/Salop/Graficos")
using Plots


#### Seccion dependiente de N #####
### Aqui se grafica la variable, dependiente unicamente del numero de bancos en el sistema###


### Inicializacion del Vector N #####

### Para terminos de graficos va de 2 hasta 20
n = collect(2:1:20)

### Inicialización de las funciones #####

#### Modo 1: Sin Competencia con firma del centro #######

#### Modo 2: Con Competencia de la firma del centro ######
