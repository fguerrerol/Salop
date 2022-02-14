#### Inicialización de librerías  y seteo de directorio madre#####

cd("/home/jesus/Documentos/MEcon/Tesis-Posibles/Salop/Graficos")
using PlotlyJS


#### Seccion dependiente de N #####
### Aqui se grafica la variable, dependiente unicamente del numero de bancos en el sistema###


### Inicializacion del Vector N #####

### Para terminos de graficos va de 2 hasta 20
n = collect(2:1:20)
tau_p = 1
tau_c = 1
### Inicialización de las funciones #####

#### Modo 1: Sin Competencia con firma del centro #######

demanda(x) = 2*x*(2/3)*(1/(2*x) +sqrt(tau_p - 1/(2*x))*sqrt(tau_c + delta) - tau_p)


demanda_r(x) = (1/(2*x)) -(2/3)*(1/(2*x) +sqrt(tau_p - 1/(2*x))*sqrt(tau_c + delta) - tau_p)

demanda_delta(x,y) = (2*x)*(2/3)*(1/(2*x) +sqrt(tau_p .- 1/(2*x))*sqrt(tau_c + y) - tau_p)





### Para terminos de determinar un nivel y ver la evolución, los costos 
### de diferenciacion se vuelven unitarios, el rendimiento del proyecto 
#### será de 50%.
tau_p = 1
tau_c = 1

#### La distancia delta también tendrá inicialmente un nivel bajo
delta = collect(0.01:0.01:0.1)
n =collect(2:1:15) 


#### Los gráficos se harán ambos considerando un nivel base y 
#### mostrara que porcentaje se tiene del nivel base para los distintos n 
demandas = demanda_delta.(n',delta)
demandas_grafico = plot([scatter(x =eachindex(n) , y = demandas[jy,:],mode ="lines",name= "Delta = $(delta[jy])") for jy in eachindex(delta)],
Layout(title ="Proporcion de demanda que conservan las firmas del perimetro", 
    yaxis_title ="Proporcion",
    xaxis_title ="Número de bancos"))


### Con esto ya se puede elaborar la función

Porcentaje_demanda = demanda.(n)

Degree_plot = plot(n,y[1,:],linewidth=2,label=v_names[1],
title = "Grado de diferenciacion de firma del perímetro",
xlabel="Número de bancos")

plot!(n,y[2,:],linewidth=2,label=v_names[2])
ylims!(0.1,2.5)
savefig(Degree_plot,"Grado-Diff.png")

