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

n_cc(A,F,tau_p,tau_c,delta) = (A^2)/(2*((A^2)*tau_p - ((A - sqrt((9*F)/2))^2)*(tau_c + delta)))

### Grados de diferenciación 

### Sin competencia al centro

theta_p_sc(A,F,tau_p) = (A^2)/((1/floor(n_sc(A,F,tau_p))) + 2*tau_p)^2


### Con competencia al centrou

theta_p_cc(A,F,tau_p,tau_c,delta) = (A^2)/(4*(tau_c + delta)*(
    tau_p - 1/(2*floor(n_cc(A,F,tau_p,tau_c,delta)))))

### Parentesis, tasa de la fimra monopolica

theta_c_cc(A,tau_c,delta) = (A^2)/(4*(tau_c + delta)^2)

### Tasas 
### Sin competencia al centro
rate_p_sc(A,F,tau_p,rho) = theta_p_sc(A,F,tau_p)*(tau_p + 1/floor(n_sc(A,F,tau_p))) + rho
### Con competencia al centro

rate_p_cc(A,F,tau_p,tau_c,delta,rho) =  (theta_p_cc(A,F,tau_p,tau_c,delta)*(1/(6*floor(n_cc(A,F,tau_p,tau_c,delta))))
+ (A*(sqrt(theta_p_cc(A,F,tau_p,tau_c,delta)) - sqrt(theta_c_cc(A,tau_c,delta)))
+2*tau_p*theta_p_cc(A,F,tau_p,tau_c,delta) + tau_c*theta_c_cc(A,tau_p,delta) 
+ delta*theta_c_cc(A,tau_p,delta) )/3  +rho)  



rate_c_cc(A,F,tau_p,tau_c,delta,rho) =  (theta_p_cc(A,F,tau_p,tau_c,delta)*(1/(3*floor(n_cc(A,F,tau_p,tau_c,delta))))
+ (A*(sqrt(theta_c_cc(A,tau_c,delta))-sqrt(theta_p_cc(A,F,tau_p,tau_c,delta)))
+tau_p*theta_p_cc(A,F,tau_p,tau_c,delta) + 2*tau_c*theta_c_cc(A,tau_p,delta) 
- delta*theta_c_cc(A,tau_p,delta) )/3  +rho)



function real_demand(A,F,tau_p,tau_c,delta,rho)
    2*floor(n_cc(A,F,tau_p,tau_c,delta))*((A*(
    sqrt(theta_p_cc(A,F,tau_p,tau_c,delta))- sqrt(theta_c_cc(A,tau_c,delta)) ) 
    - rate_p_cc(A,F,tau_p,tau_c,delta,rho) + rate_c_cc(A,F,tau_p,tau_c,delta,rho) 
    + theta_c_cc(A,tau_c,delta)*delta)/(theta_p_cc(A,F,tau_p,tau_c,delta)))
end

function real_demand_alone(A,F,tau_p,tau_c,delta,rho)
    ((A*(
    sqrt(theta_p_cc(A,F,tau_p,tau_c,delta))- sqrt(theta_c_cc(A,tau_c,delta)) ) 
    - rate_p_cc(A,F,tau_p,tau_c,delta,rho) + rate_c_cc(A,F,tau_p,tau_c,delta,rho) 
    + theta_c_cc(A,tau_c,delta)*(1/floor(n_cc(A,F,tau_p,tau_c,delta))))/(theta_p_cc(A,F,tau_p,tau_c,delta)))
end





F = collect(0.005:0.001:0.025)
tau_p =collect(1.0:0.001:1.4)








##### Layouts

#### Bancos
layout_bnk_sc = Layout(title="Cantidad de bancos del perimetro sin firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title="nₚ"))

layout_bnk_cc =  Layout(title="Cantidad de bancos del perimetro con firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title="nₚ"))
##### Grados
layout_deg_sc = Layout(title="Grado de diferenciacion del perimetro sin firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title=L"θₚ"))

layout_deg_cc = Layout(title="Grado de diferenciacion del perimetro con firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title="θₚ"))
### Tasas ####
layout_rate_sc =Layout(title="Tasa  del perimetro sin firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title="rₚ"))

layout_rate_cc =Layout(title="Tasa  del perimetro con firma al centro",
scene=attr(
    yaxis_title ="F",
    xaxis_title ="τₚ",
    zaxis_title="rₚ"))


layout_rate_perimeter = Layout(title="Tasa  del perimetro con firma al centro",
scene=attr(
    yaxis_title ="τ_centro",
    xaxis_title ="τₚ",
    zaxis_title="rₚ",
    camera_eye=attr(x=2, y=2, z=0.5)))
 
    layout_rate_centro = Layout(title="Tasa  del centro ",
    scene=attr(
        yaxis_title ="τ_centro",
        xaxis_title ="τₚ",
        zaxis_title="r_centro",
        camera_eye=attr(x=2, y=2, z=0.5)))
     

        layout_n_banks = Layout(title="Número de bancos bajo F = 0.005 y δ = 0.1 ",
        scene=attr(
            yaxis_title ="τ_centro",
            xaxis_title ="τₚ",
            zaxis_title="nₚ",
            camera_eye=attr(x=2, y=2, z=0.5)))
         
            layout_n_banks2 = Layout(title="Número de bancos bajo costos fijos y de diferenciación ",
        scene=attr(
            yaxis_title ="τ_centro",
            xaxis_title ="τₚ",
            zaxis_title="nₚ",
            camera_eye=attr(x=2, y=2, z=0.5)))
         


#####



##### 
#### Evaluación ###### 

bancos_cc = floor.(n_cc.(1.5,F',tau_p,1,0.12))
bancos_sc = floor.(n_sc.(1.5,F',tau_p))

degree_cc = theta_p_cc.(1.5,F',tau_p,1,0.12)
degree_sc = theta_p_sc.(1.5,F',tau_p)


r_p_cc = rate_p_cc.(A,F',tau_p,1,0.12,0.12)
r_p_sc = rate_p_sc.(A,F',tau_p,0.12)

bancos_sc_plot = plot(surface(z= bancos_sc, x= tau_p, y=F),layout_bnk_cc) 
bancos_cc_plot = plot(surface(z= bancos_cc, x= tau_p, y=F),layout_bnk_cc) 


theta_cc_plot = plot(surface(z= degree_cc, x= tau_p, y=F),layout_deg_cc)
theta_sc_plot = plot(surface(z= degree_sc, x= tau_p, y=F),layout_deg_sc)

rate_sc_plot = plot(surface(z= r_p_sc, x= tau_p, y=F),layout_rate_sc) 
rate_cc_plot = plot(surface(z= r_p_cc, x= tau_p, y=F),layout_rate_cc) 


#Grados de diferenciacion:
F2 = collect(0.00001:0.0001:0.045)
diff_per_sc = theta_p_sc.(A,F2,1)

diff_per_cc = theta_p_cc.(A,F2,1,1,collect(0.05:0.05:0.2)')

diff_per = [diff_per_sc diff_per_cc]

names = ["Salop","δ =0.05","δ =0.1","δ =0.15","δ =0.2" ]
degrees = plot([scatter(x =F2 , y = diff_per[:,jy],mode ="lines",name= names[jy]) for jy in eachindex(collect(1:1:5))],
Layout(title ="Grado de diferenciacion de los bancos del perímetro", 
    yaxis_title ="θₚ",
    xaxis_title ="Fixed cost"))


rate_per_sc = rate_p_sc.(A,F2,1,0.06)

rate_per_cc = rate_p_cc.(A,F2,1,1,collect(0.05:0.05:0.2)',0.06)

rate_per = [rate_per_sc rate_per_cc]

rates_plot = plot([scatter(x =F2 , y = rate_per[:,jy],mode ="lines",name= names[jy]) for jy in eachindex(collect(1:1:5))],
Layout(title ="Tasa de de los bancos del perímetro", 
    yaxis_title ="rₚ",
    xaxis_title ="Fixed cost"))


#### Tasas con respecto a costos de diferenciacion


tau_p = collect(0.5:0.01:1.5)
tau_c = collect(0.5:0.01:1.5)

F = 0.0005

A = 1.5

r_per_costs_cc = rate_p_cc.(A,F,tau_p,tau_c',0.1,0.12)
r_center_costs_cc = rate_c_cc.(A,F,tau_p,tau_c',0.1,0.12)

plot(surface(z= r_per_costes_cc, x= tau_p, y= tau_c,colorbar_x=0.2),layout_rate_perimeter)
plot(surface(z= r_center_costes_cc, x= tau_p, y= tau_c,colorbar_x=0.8),layout_rate_centro)






#### Proporción de bancos
A =5
tau_p = collect(1.1:0.01:1.8)
tau_c = collect(0.9:0.01:1.2)
F= 0.011
delta = 0.06
numero_bancos = floor.(n_cc.(1.5,0.005,tau_p,tau_c',0.1))
Bank_number = plot(surface(z=numero_bancos,x=tau_p,y=tau_c)) 

### Bajo costos fijos y costos de diferenciación
A = 1.5
F = collect(0.0001:0.0001:0.001)
tau_p = collect(1.1:0.01:1.8)
n_bancos2 = floor.(n_cc.(A,F,tau_p',1,0.075))
b_number2 = plot(surface(z=n_bancos2, x=F, y=tau_c),layout_n_banks2)




#### Demanda de los bancos 


A = 1.5
tau_p = 1
tau_c =1
F = collect(0.045:-0.001:0.01)
delta=collect(0.03:0.01:0.14)
demand_prop = real_demand.(A,F,tau_p,tau_c,delta',0.06)


demands = plot([scatter(x = -F , y = demand_prop[:,jy],mode ="lines",name= "Delta = $(delta[jy])") for jy in eachindex(delta)],
Layout(title ="Proporcion de demanda conservada", 
    yaxis_title ="Proporciónₚ",
    xaxis_title ="Costo Fijo"))