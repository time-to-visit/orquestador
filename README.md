# orquestador

## Explicacion de todo el proyecto

este proyecto se puede ejecutar sin orquestador y con orquestador

### sin orquestador
Revisar cada proyecto internamente, leer readme del proyecto.

* usuario https://github.com/time-to-visit/service-user/tree/main
* guias https://github.com/time-to-visit/service-guias
* rutas https://github.com/time-to-visit/servicio-rutas
* sitios https://github.com/time-to-visit/service-sitios

### con orquestador

Iniciar db

entrar a la base de datos
`mysql -u root -p -h 127.0.0.1 -P 3306`

ejecutar los scripts de creacion de base de datos en la carpeta db

*cambiar configuraciones en ccada proyecto y colocal host db


database:
  driver: "mysql"
  dbname: "sites-time-to-visit"
  username: "root"
  password: ""
  host: "db"
  port: "3306"
  max_lifetime: 7200
  max_open_conns: 150
  max_idle_conns: 50

server:
  port: "3002"
  secret: "jdnfksdmfksda"
  #release | debug
  mode: "release"
credential:
  gcbucket: "dasdasd-9053b.appspot.com"
microservices:
  auth: http://localhost:3001/verify


` docker-compose.yml" up -d --build db ` 
## Orquestador
 https://github.com/time-to-visit/orquestador
