
# LIBRERIAS ---------------------------------------------------------------

library(tidyverse)
library(datos)


# DATOS -------------------------------------------------------------------

head(aerolineas)
head(aeropuertos)
head(aviones)
head(clima)


# CLAVES ------------------------------------------------------------------

aviones %>% 
  count(codigo_cola) %>%
  filter(n > 1)

clima %>%
  count(anio, mes, dia, hora, origen) %>%
  filter(n>1)


# UNIONES DE TRANSFORMACION -----------------------------------------------

# Union hacia la izquierda

vuelos2 <- vuelos %>%
  select(anio:dia, hora, origen, destino, codigo_cola, aerolinea)
vuelos2 %>%
  select(-(hora:destino)) %>%
  left_join(aerolineas, by = "aerolinea") %>% head()
