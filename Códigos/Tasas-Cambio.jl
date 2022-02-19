###### Cambio de tasas                          ###    
##### Elaborado por Francisco Guerrero para     ###
##### Tesis de Maestria en Economia             ###
##### Lenguaje :Julia                           ###

#### En este codigo se ver el cambio de tasas ante movimientos 
#### el cambio de número de firmas en equilibrio debido a 
#### cambios de parámetros exógenos tales como 
#### tau_c, costos de diferenciacion de la firma del centro
#### tau_p, Costos de Diferenciacion de la firma del perimetro

#### Para esto se tiene que el número de bancos del perimento bajo
#### 2 condiciones son 

using PlotlyJS




# Sin competencia al centro

n_sc(A,F,tau_p) = (A-sqrt(F))/(2*tau_p*sqrt(F))


# Con competencia al centro

n_cc(A,F,tau_p,tau_c,delta) = (A^2)/2((A^2)*tau_p - ((A - sqrt((9*F)/2))^2)*(tau_c + delta))

### Grados de diferenciación 

### Sin competencia al centro

theta_p_sc(A,F,tau_p) = (A^2)/((1/floor(n_sc(A,F,tau_p))) + 2*tau_p)^2


### Con competencia al centro

theta_p_cc(A,F,tau_p,tau_c,delta) = (A^2)/(4*(tau_c + delta)*(tau_p - 1/(2*floor(n_cc(A,F,tau_p,tau_c,delta)))))

### Tasas 
### Sin competencia al centro
rate_p_sc((A,F,tau_p) =
### Con competencia al centro



F = collect(0.005:0.001:0.025)
tau_p =collect(1.0:0.001:1.4)

degree_sc = theta_p_sc.(1.5,collect(0.005:0.001:0.025)',collect(1:0.01:1.4))


degree_cc = theta_p_cc.(1.5,F',tau_p,1,0.12)

bancos_sc = floor.(n_cc.(1.5,F',tau_p,1,0.12))
bancos_cc = floor.(n_sc.(1.5,F',tau_p))

##### Layouts

layout_deg_sc = Layout(title="Grado de diferenciacion del perimetro sin firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title =L"$\tau_p$",
    zaxis_title=L"$\theta_p$"))

layout_deg_cc = Layout(title="Grado de diferenciacion del perimetro con firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title =L"$\tau_p$",
    zaxis_title=L"$\theta_p$"))


#####
tasa    

theta_cc_plot = plot(surface(z= degree_sc, x= tau_p, y=F),layout_deg_cc)
theta_sc_plot = plot(surface(z= degree_sc, x= tau_p, y=F),layout_deg_sc)
