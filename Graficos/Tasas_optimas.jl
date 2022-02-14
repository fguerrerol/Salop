tau_p = collect(1:0.01:2)
tau_c = collect(1:0.01:2)

n = 10
A = 1.5
delta = 0.05
rho = 0.1

r_p(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta)*sqrt(tau_p - (1/(2*n)))))*(
    ( sqrt(tau_c + delta)-sqrt(tau_p - (1/(2*n))))/(3) + tau_p/(2*sqrt(tau_p - (1/(2*n))))
) + rho







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

r_c(tau_p,tau_c) = ((A^2)/(2*(tau_c + delta)*sqrt(tau_p - (1/(2*n)))))*(
    (1/(4*n*sqrt(tau_p - (1/(2*n)))))
    -( sqrt(tau_c + delta)-sqrt(tau_p - (1/(2*n))))/(3) + (tau_p*sqrt(tau_p - (1/(2*n))))/(2*(tau_c+delta))
) + rho


tasa_ctr_surface = plot(surface(z= r_c.(tau_p',tau_c), x= tau_c, y = tau_p),layout)


