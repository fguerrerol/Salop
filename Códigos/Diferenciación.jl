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
theta_p_modo1(x) =  (A^2)/((tau_p+(1/(x)))^2)
#### Modo 2: Con Competencia de la firma del centro ######
theta_p_modo2(x) = (A^2)/(4*(delta+tau_c0)*(1-(1/(2*x))))


### Para terminos de determinar un nivel y ver la evolución, los costos 
### de diferenciacion se vuelven unitarios, el rendimiento del proyecto 
#### será de 50%.
tau_p = 1
tau_c0 = 1
A = 1.5
#### La distancia delta también tendrá inicialmente un nivel bajo
delta = 0.2 


#### Los gráficos se harán ambos considerando un nivel base y 
#### mostrara que porcentaje se tiene del nivel base para los distintos n 

baselined = (A^2)/((tau_p+(1/(2)))^2)
baseline2 = (A^2)/(4*(delta+tau_c0)*(1-(1/(2*2))))

### Con esto ya se puede elaborar la función

Grado_perimetro_modo1 = theta_p_modo1.(n)/baselined

Grado_perimetro_modo2 = theta_p_modo2.(n)/baselined

y=[Grado_perimetro_modo1,Grado_perimetro_modo2]

v_names =["Sin firma al centro", "Con firma al centro"]
Degree_plot = plot(n,y[1,:],linewidth=2,label=v_names[1],
title = "Grado de diferenciacion de firma del perímetro",
xlabel="Número de bancos")

plot!(n,y[2,:],linewidth=2,label=v_names[2])
ylims!(0.1,2.5)
savefig(Degree_plot,"Grado-Diff.png")




n_2(x,y) = ((x^2)/(2*(1 -((1 - sqrt(9*y/2))^2)*(1 + delta))))


grafo = plot(surface(A_v, F_v,n_2),title="Optimal Bank's number", xlabel="Project's Return", ylabel="Fixed Cost")




A_v = collect(1.4:0.01:0.05) 
n_2(x,y) = ((x^2)/(2*(1 -((1 - sqrt(9*y/2))^2)*(1 + delta))))

n_3(x,y) = (A^2)/(2*(x -((1 - sqrt(9*F/2))^2)*(y + delta)))



plot(n,Degree,title="Grado de diferenciacion bajo competencia con fintech",
    xlabel= "Numero de bancos", ylabel="Nivel base")