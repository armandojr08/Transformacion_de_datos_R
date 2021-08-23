
# LIBRERIAS ---------------------------------------------------------------

library(dplyr)
library(datos)
library(ggplot2)
library(funModeling)
library(tictoc)

# DATOS -------------------------------------------------------------------

vuelos <- vuelos
dim(vuelos)
colnames(vuelos)
head(vuelos)
?vuelos
str(vuelos)
df_status(vuelos)
attach(vuelos)


# FILTER ------------------------------------------------------------------

# Vuelos del 1 de enero del 2013
vuelos %>% filter(anio == 2013, mes == 1, dia == 1) -> vuelo1ene
head(vuelo1ene)

# Suelen surgir problemas en algunos casos cuando se operan,
# aritmeticamente, los numeros de coma flotante
sqrt(2)^2 == 2
1 / 49 * 49 == 1
# Para superar este problema, se suele utilizar el near()
near(sqrt(2)^2, 2)
near(1 / 49 * 49, 1)

# Vuelos que partieron en noviembre o diciembre del 2013
nov.dic <- vuelos %>% filter(anio == 2013, mes == 11 | mes == 12)
head(nov.dic)
tail(nov.dic)

# Vuelos que no se retrasarin en mas de 2 hoeas
filter(vuelos, !(atraso_llegada > 120 | atraso_salida > 120))
filter(vuelos  , atraso_llegada <= 120, atraso_salida <= 120)


# ARRANGE -----------------------------------------------------------------

vuelos %>% arrange(anio, mes, dia) %>% head()
vuelos %>% arrange(desc(mes), dia) %>% head()
vuelos %>% arrange(mes, desc(dia)) %>% head()
vuelos %>% arrange(desc(mes), desc(dia)) %>% head()
# Ojo con los NA. Estos siempre se ordenan al final



# SELECT ------------------------------------------------------------------

# Funcion selecte()

vuelos %>% select(dia, mes, aerolinea) %>% head()
vuelos %>% select(horario_salida:atraso_llegada) %>% head()
vuelos %>% select(-(anio:atraso_llegada),-(tiempo_vuelo:fecha_hora)) %>% head()

# Funciones auxiliares que pueden ser usados dentro de select()

# starts_with("abc") : columnas que comienzan con l
vuelos %>% select(starts_with("h"), everything()) %>% head()

# Funcion rename()
vuelos %>% rename(cola_num = codigo_cola) %>% select(cola_num) %>% head()
colnames(vuelos)



# MUTATE ------------------------------------------------------------------

# Funcion mutate()

vuelos2 <- vuelos %>%
  select(mes:dia, starts_with("atraso"),distancia, tiempo_vuelo)
vuelos2 %>% mutate(
  ganancia = atraso_salida - atraso_llegada,
  velocidad = distancia/tiempo_vuelo*60
) %>% head

# Funcion transmute()

vuelos2 %>% transmute(
  ganancia = atraso_salida - atraso_llegada,
  horas = tiempo_vuelo/60,
  ganancia_por_hora = ganancia/horas
)


# SUMMARISE ---------------------------------------------------------------

# Funcion summarise para realizar resumenes

vuelos %>% summarise(atraso_prom = mean(atraso_salida, na.rm = T))
vuelos %>% group_by(mes) %>% summarise(atraso_prom = mean(atraso_salida, na.rm = T))
vuelos %>% group_by(destino) %>%
  summarise(conteo = n(),
            distancia = mean(distancia, na.rm = T),
            atraso = mean(atraso_llegada, na.rm = T)
            ) %>% head() -> vuelos3

# Uso de la funcion n_distinc()


