# Trabajo Práctico Especial: Consulta y Transformación de documentos XML 
## 1. Acerca del proyecto
> La finalidad del presente trabajo es obtener un archivo JSON con la información de las áreas geográficas que tengan datos sobre la cantidad de personas que trabajan; y que esos datos sean en un intervalo de N años como mínimo, número elegido por el usuario.
## 2. Dependencias
* Saxon
## 3. Instalación
En Linux:
* Mueva los archivos del paquete a donde desee ejecutar el programa. Nos referiremos a este destino como *{installationHome}* en adelante.
* Dentro de la terminal de Linux, debe posicionarse en dicho directorio: `$ cd {instalationHome}`
* Luego cambie los permisos del archivo para hacerlo ejecutable: `$ chmod u+x tp.sh`
> Asegúrese de que el archivo de datos se llame *data.xml* y el de metadatos *metadata.xml*
* ¡Y listo! Ya lo podrá ejecutar dentro del mismo directorio.
## 4. Modo de uso
Dentro del directorio *{instalationHome}*, escriba en la línea de comandos: `$ ./tp.sh historical_years`, siendo *historical_years* el parámetro N de los años requeridos para filtrar. El archivo JSON de salida lo encontrará dentro del mismo directorio, bajo el nombre *output.json*
## 4. Errores
El programa tirará un error en el caso de que:
* La cantidad de parámetros sea distinto de uno.
* El parámetro N de los años mínimos a filtrar sea distinto a un entero positivo .
* El archivo *data.xml* se encuentre vacío.
