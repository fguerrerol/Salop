#### Importacion de librerías

using PlotlyJS


##### Establecimiento de carpeta de guardado de archivos

cd("/home/jesus/Documentos/MEcon/Tesis-Posibles/Salop/Graficos")

## Declaracion de variables
tau_p = collect(1:0.01:2)
tau_c = collect(1:0.01:2)

n = 10
A = 1.5
delta = 0.05
rho = 0.1



### Declaracio nde al funcio nde tasa del perimetro
r_p(tau_p,tau_c,delta) = ((A^2)/(2*(tau_c + delta)*sqrt(tau_p - (1/(2*n)))))*(
    ( sqrt(tau_c + delta)-sqrt(tau_p - (1/(2*n))))/(3) + tau_p/(2*sqrt(tau_p - (1/(2*n))))
) + rho

#### Tasa del centro
r_c(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta)*sqrt(tau_p - (1/(2*n)))))*(
    (1/(4*n*sqrt(tau_p - (1/(2*n)))))
    -( sqrt(tau_c + delta)-sqrt(tau_p - (1/(2*n))))/(3) + (tau_p*sqrt(tau_p - (1/(2*n))))/(2*(tau_c+delta))
) + rho



#### Generacion de Layout

layout_per = Layout(title="Tasa de la firma del perimetro",
scene=attr(
    yaxis_title ="Cost-Per",
    xaxis_title ="Cost-Centro ",
    zaxis_title="Tasa de el banco",
    camera_eye=attr(x=2, y=2, z=0.5)))

tasa_per_surface = plot(surface(z= r_p.(tau_p',tau_c), x= tau_c, y = tau_p),layout_per)
savefig(tasa_per_surface,"Tasa_perimetro.png")

layout = Layout(title="Tasa de la firma del centro",
scene=attr(
    yaxis_title ="Cost-Per",
    xaxis_title ="Cost-Centro ",
    zaxis_title="Tasa de el banco",
    camera_eye=attr(x=2, y=2, z=0.5)))



tasa_ctr_surface = plot(surface(z= r_c.(tau_p',tau_c), x= tau_c, y = tau_p),layout)

#### En teoria este codigo sirve para hacer multiples gráficos, de hecho si funciona
#### Pero los cambios que prove no eran muy significativos para alterar el comportamiento 
#### de las firmas, la reducción fue menor


delta1 = 0.05
r_p_1(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta1)*sqrt(tau_p - (1/(2*n)))))*(
    ( sqrt(tau_c + delta1)-sqrt(tau_p - (1/(2*n))))/(3) + tau_p/(2*sqrt(tau_p - (1/(2*n))))
) + rho

delta2=0.10
r_p_2(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta2)*sqrt(tau_p - (1/(2*n)))))*(
    ( sqrt(tau_c + delta2)-sqrt(tau_p - (1/(2*n))))/(3) + tau_p/(2*sqrt(tau_p - (1/(2*n))))
) + rho

delta3= 0.15
r_p_3(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta3)*sqrt(tau_p - (1/(2*n)))))*(
    ( sqrt(tau_c + delta3)-sqrt(tau_p - (1/(2*n))))/(3) + tau_p/(2*sqrt(tau_p - (1/(2*n))))
) + rho


fig = make_subplots(

    rows=1, cols=3,

    specs=fill(Spec(kind="scene"), 1, 3),
    

    subplot_titles = ["Delta = 0.05" "Delta = 0.1" "Delta = 0.15"]
)
add_trace!(

    fig,

    surface(z= r_p_1.(tau_p',tau_c), x= tau_c, y = tau_p,showscale=false,Layout=layout),

    row=1, col=1)

add_trace!(

    fig,

    surface(z= r_p_2.(tau_p',tau_c), x= tau_c, y = tau_p,showscale=false),

    row=1, col=2)
add_trace!(

    fig,

    surface(z= r_p_3.(tau_p',tau_c), x= tau_c, y = tau_p,showscale=false),

    row=1, col=3)
relayout!(

    fig,

    title_text="3D subplots with different colorscales",

    height=400,

    width=800

)

fig