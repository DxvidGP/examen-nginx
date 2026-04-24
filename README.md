# examen-nginx

## Estructura:

>proyecto-web/
>
>│
>├── docker-compose.yml
>
>├── setup.sh (funcional en linux)
>
>├── nginx-proxy/
>
>│   └── nginx.conf
>
>└── webcontent/
>
>    ├── index.html
>
>    └── media/

<img width="524" height="121" alt="image" src="https://github.com/user-attachments/assets/6d68337d-40cd-427e-9ad8-c07d9163204d" />


## Explicación diseño

>nginx:alpine para el proxy: Lo uso debido es el reverse proxy más conocido y usado. Además va muy bien también para el balanceo.
>
>httpd:alpine para los backends: Con esta imagen, se garantiza que no haya problemas de incompatibilidad entre backends. Es estable y se garantiza que las web funcionen bien.
>
>bind mount para volumen compartido: Este volumen nombrado lo uso debido a que es gestionado por Docker, además es portable y el script setup.sh se complementa con docker cp.

## Capturas de pantalla:

<img width="1912" height="834" alt="image" src="https://github.com/user-attachments/assets/14666625-a5f9-49d8-848e-ebaede29d354" />

<img width="1912" height="834" alt="image" src="https://github.com/user-attachments/assets/defd282c-c414-412c-a9bf-e54667a01e96" />

<img width="1912" height="834" alt="image" src="https://github.com/user-attachments/assets/3e25445a-c89f-4d21-92ad-ff619ba04390" />

## Comandos necesarios para el funcionamiento:

>Para encender el docker:
>docker compose up -d (en el directorio del docker)

>Para verificar el balanceo de carga:
>curl -s -I http://localhost | grep X-Backend

>Estado del proxy:
>curl -s http://localhost/nginx-status

>Detener todo:
>docker compose down

    
