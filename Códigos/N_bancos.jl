#### Inicializacion
### carpeta de guardado
cd("/home/jesus/Documentos/MEcon/Tesis-Posibles/Salop/Graficos")

### Librerias y demas
using PlotlyJS
tau_c = 1
A = 1.5 
tau_p = collect(1:0.01:2)
F = collect(0.005:0.001:0.08)
delta = 0.1
### Sin firma al centro

n_1(x,y)= (A - sqrt(y))/(2*x*sqrt(y)) 

### Con firma al centro
base_line_1 = (A^2)/(2*((A^2)*1 - 
((A - sqrt((9*0.005)/2))^2)*(tau_c + delta)))

n_2(x,y) = ((A^2)/(2*((A^2)*x - 
((A - sqrt((9*y)/2))^2)*(tau_c + delta))))/base_line_1

n_test(x,y) = (A^2)/(2*((A^2)*x - 
((A - sqrt((9*y)/2))^2)*(tau_c + delta)))
layout = Layout(title="Proporcion de bancos del  perimetro bajo competencia con firma al medio",
scene=attr(
    yaxis_title ="Costo fijos",
    xaxis_title ="Costos por diferenciación ",
    zaxis_title="Proporción de bancos",
    camera_eye=attr(x=2, y=2, z=0.5)))

bancos_plot = plot(surface(z= n_2.(tau_p',F), x= F, y = tau_p),layout)

tau_c_eleccion = collect(1:0.1:1.4)
tau_p_eleccion = collect(1:0.1:1.7)
Costo_fijo = 0.05
delta = 0.05
A = 1.5

base_line = ((A^2)/(2*((A^2)*tau_p_eleccion[1] - 
((A - sqrt((9*Costo_fijo)/2))^2)*(tau_c_eleccion[1] + delta))))
n_3(x,y) = ((A^2)/(2*((A^2)*x - 
((A - sqrt((9*Costo_fijo)/2))^2)*(y + delta))))/base_line

savefig(bancos_plot,"Bancos1.png")

layout = Layout(title="Proporcion de bancos del  perimetro bajo competencia con firma al medio",
scene=attr(
    yaxis_title ="Cost-Per",
    xaxis_title ="Cost-Centro ",
    zaxis_title="Prop. bancos",
    camera_eye=attr(x=2, y=2, z=0.5)))

bancos_plot_2 = plot(surface(z= n_3.(tau_p_eleccion',tau_c_eleccion), x= tau_c_eleccion, y = tau_p_eleccion),layout)

savefig(bancos_plot_2,"Bancos2.png")


