#### Inicialización de librerías  y seteo de directorio madre#####

cd("/home/jesus/Documentos/MEcon/Tesis-Posibles/Salop/Graficos")
using Plots


#### Seccion dependiente de N #####
### Aqui se grafica la variable, dependiente unicamente del numero de bancos en el sistema###


### Inicializacion del Vector N #####

### Para terminos de graficos va de 2 hasta 20
n = collect(2:1:20)

### Para terminos de determinar un nivel y ver la evolución, los costos 
### de diferenciacion se vuelven unitarios, el rendimiento del proyecto 
#### será de 50%.
tau_p = 1
tau_c0 = 1
A = 1.5
#### La distancia delta también tendrá inicialmente un nivel bajo
delta = 0.2 
### Inicialización de las funciones #####

#### Modo 1: Sin Competencia con firma del centro #######
theta_p_modo1(x) =  (A^2)/((tau_p+(1/(x)))^2)

tasa_p_modo_1(x) =theta_p_modo1(x)*((1/x) + tau_p) + 0.2
#### Modo 2: Con Competencia de la firma del centro ######
theta_p_modo2(x) = (A^2)/(4*(delta+tau_c0)*(1-(1/(2*x))))

tasa_p_modo_2a(x) = (A*(sqrt.(theta_p_modo2(x))) + 
((1/(2*x)) .+ 2*tau_p)*theta_p_modo2(x)+(tau_c0+delta)*theta_c)/3 +(0.2 - (A*sqrt(theta_c)/3))
 



#tasa_p_modo_2(x) = ((A^2)/(2*(tau_c0 + delta)))*(
#     (tau_p)/(2*(tau_p - (1/2*n)) - ()/(sqrt())     )




theta_c = (A^2)/(4*(tau_c0 + delta))

#### Los gráficos se harán ambos considerando un nivel base y 
#### mostrara que porcentaje se tiene del nivel base para los distintos n 

baseline1 = (A^2)/(tau_p+(1/(2))) +0.2
baseline2 = (A*(sqrt(theta_p_modo2(2))) + 
( 1/4 + 2*tau_p)*theta_p_modo2(2)+(tau_c0+delta)*theta_c)/3 +(0.2 - (A*sqrt(theta_c)/3))
 

### Con esto ya se puede elaborar la función



rates_plot =plot(n,tasa_p_modo_1.(collect(2:1:20))/baseline1, 
title="Tasas de los bancos del perimetro",
label= "Sin firma al centro",xlabel="Número de bancos",linewidth=2,ylims= [0.5 2.5])


plot!(n,tasa_p_modo_2a.(collect(2:1:20))/baseline1, 
label= "Con firma al centro",linewidth=2)
ylims!(0.2,2)


savefig(rates_plot,"Tasa.png")