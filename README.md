# orquestador

## Explicacion de todo el proyecto

este proyecto se puede ejecutar sin orquestador y con orquestador

### advertencia
si usted manejo un computador con sistema operativo windwos, lo mas recomendable es correr sin orquestador el proyecto, ya que el wsdl2 suele consumir demasiados recursos, y podria sobrecargar la maquina

### sin orquestador
Revisar cada proyecto internamente, leer readme del proyecto.

* usuario https://github.com/time-to-visit/service-user/tree/main
* guias https://github.com/time-to-visit/service-guias
* rutas https://github.com/time-to-visit/servicio-rutas
* sitios https://github.com/time-to-visit/service-sitios

### con orquestador


#### pasos iniciales
para poder correr el proyecto se debe tener en cuenta que se deben clonar los respositorios del backend en la raiz de este proyecto

#### construir imagen db
  ` docker compose  docker-compose.yml" up -d --build db ` 

#### abrir bash
 ` docker exec -it mysql-db bash ` 

#### Iniciar db
entrar a la base de datos
`mysql -u root -p -h 127.0.0.1 -P 3306`

ejecutar los scripts de creacion de base de datos en la carpeta sql

*cambiar configuraciones en ccada proyecto y colocal host db

![image](https://github.com/time-to-visit/orquestador/assets/32990133/9a5cb2e6-7eba-48d1-b177-1cbcf0fa2a88)

#### construir el resto del proyecto

`  docker compose  -f "docker-compose.yml" up -d --build alertmanager caddy cadvisor grafana nodeexporter prometheus pushgateway routes sites users ` 

si quiere omitir temas de monitoreo y no gastar tantos recursos es:

`  docker compose  -f "docker-compose.yml" up -d --build  routes sites users ` 

## Orquestador
 https://github.com/time-to-visit/orquestador
