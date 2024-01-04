#! /bin/bash

: "
    comando que voy aprediendo de curl 
   -v ver el codigo de estdo que llego la informacion
   -i muestra menos informacion, y sobre muestra la cabezera
   /numbero estamos indicando dame un dato fijo
   -o crea un archivo donde me guardes la informacion 
   cat solo podemos leer archivos de tipo texto

   peticion post 
  curl  --data  "titulo=jijisjfi "&" cuerpo=hfuehuehaiuhewui" 

  peticiones put
  curl -X PUT --data "title=nuevo nombre"&"body=nuevo cuerpo de la informacion"

  peticion delete
  curl -X DELETE direccion

  passaword 
  curl -u nombre:passaword 
----------------------------------------------------------------------------------------------------
tareas generales del proyecto:  
1) hacer que el servidor se active al iniciar, el scripting
2) solo al metdo que se usa informacion dentro del servidor 
3) crear nuevos usuarios, y guardar esa informacion dentro del archivo de user.json 
4) poder eliminar un usario  
"
#https://jsonplaceholder.typicode.com/posts


./scripting/power_on_sever.sh

direction_of_json(){
  
 if [ -d "json" ] 
   then
   echo "-----------------------------------------------------------------------------"
   else
     mkdir json 
  fi

}


get() {
  
 echo "------------------------------------------------------------------------------" 
  read -p "coloque la url que quiere pedir dato:" url #ponermos la url
 echo "------------------------------------------------------------------------------"
  
  direction_of_json 

  curl $url > json/user.json #creamos un archivo para guadar datos del json > pero eso datos vamos a mostrar en una api o terminal
  
  echo "------------------------------------------------------------------------------"
  read -p "dode quieres ver los datos en pagina wed(p) o terminal(t):" result
 
  case $result in 
   p)
    npm run dev1 #hay problemas al momento de activar el servidor, "problema en econtrar la direccion del archivo que tiene, el servidor"
   ;;
   t)
      cat json/user.json
  ;;
   *) exit 0
 esac   
}


# modificar la forma de actualizar datas, o crear un dato
# intentar ordenar los datos nuevos que entran

post(){
 direction_of_json

# poder crear a un usuario 
  read -p "title:" title 
  read -p "body:"  body

 curl --data "title=${title}&body=${body}" $url >> json/user.json # problema de organizacion del json y asinacion del id // a parte de borrar datos   
 
}



# menu de presentacion 
menu(){

array_of_colors=("[34m" "[32m" "[31m" "[37m")

select_of_color=${array_of_colors[$1]}

echo -e "\033${select_of_color} 
    |----------------------------------|                       
    |  1) pedir datos a una url        |
    |  2) crear datos                  |
    |  0) salir                        |
    |----------------------------------| 
" 
read -p "seleciones una occion:" seleccion

 case $seleccion in 
     1)
      get  
    ;;
     2) 
      post   
    ;;
    *) exit 0
    ;;      
 esac 

}


# mostrando un mini menu para selecionar un color al las letras de la terminal 
echo "
 |----------------------------------------|
 | seleccione un color para la letras:    |
 |----------------------------------------|
 | 0) azul                                |
 | 1) verde                               |
 | 2) rojo                                |
 | 3) blanco                              |
 |----------------------------------------|
"
read -p "color para terminal: " color

menu $color












