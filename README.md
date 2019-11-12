# Trabajo Práctico Especial: Consulta y Transformación de documentos XML 
## 1. Acerca del proyecto
> La finalidad del presente trabajo es obtener un archivo JSON con la información de las áreas geográficas que tengan datos sobre la cantidad de personas que trabajan, y que esos datos sean en un intervalo de N años.
## 2. Instalación
En Linux:
* Descargar los archivos *tp.sh, xml_query.xq, json_transform.xs* donde desee ejecutar el programa. Vamos a referirnos a este destino como *{installationHome}* en adelante.
* Dentro de la terminal de Linux, nos posicionamos en dicho directorio: `$ cd {instalationHome}`
* Luego cambiamos los permisos del archivo para hacerlo ejecutable: `$ chmod u+x tp.sh`
* Asegurarse que el archivo de datos se llame *data.xml" y el de metadatos *metadata.xml*
* ¡Y listo! Ya lo podremos ejecutar dentro del mismo directorio.
## 3. Modo de uso
Dentro del directorio *{instalationHome}*, escribimos en la línea de comandos: `$ ./tp.sh historical_years`, siendo *historical_years* el parámetro N de los años requeridos para filtrar. El archivo JSON de salida lo encontraremos dentro del mismo directorio, bajo el nombre *output.json*
