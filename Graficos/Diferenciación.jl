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
### de diferenciacion se vuelven unitarios.
tau_p = 1
tau_c0 = 1
#### La distancia delta también tendrá inicialmente un nivel bajo
delta = 0.2 







tau_p = collect(1:0.01:2)
tau_c = collect(1:0.01:2)
l = 0.03
delta = 0.05

n = collect(2:1:20)

##### Gtrado de diferenciacion con número de bancos

theta_p(x) = (A^2)/(4*(delta+tau_c0)*(1-(1/(2*x))))

### Grado de diferenciación sin firma al centro
theta_per(x) =  (A^2)/((1+(1/(x)))^2)



Degree = theta_p()

#### Grado de diferenciacion


theta_p(x,y) = (A^2)/(4*(delta+y)*(x - l/2))

#### 


theta_c(y) = (A^2)/(4*((delta+y)^2))

F = 0.05

F_v = collect(0.01:0.01:0.2)



n_2(x,y) = ((x^2)/(2*(1 -((1 - sqrt(9*y/2))^2)*(1 + delta))))


grafo = plot(surface(A_v, F_v,n_2),title="Optimal Bank's number", xlabel="Project's Return", ylabel="Fixed Cost")




A_v = collect(1.4:0.01:0.05) 
n_2(x,y) = ((x^2)/(2*(1 -((1 - sqrt(9*y/2))^2)*(1 + delta))))

n(x,y) = (A^2)/(2*(x -((1 - sqrt(9*F/2))^2)*(y + delta)))



plot(n,Degree,title="Grado de diferenciacion bajo competencia con fintech",
    xlabel= "Numero de bancos", ylabel="Nivel base")