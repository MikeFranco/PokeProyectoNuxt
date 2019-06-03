# Poke Proyecto Frontend

> Frontend para el proyecto final de la materia Fundamentos de Programación Orientada a Objetos <br/>
> Nombre del alumno: **Miguel Ángel Franco Peza** <br/>
> Profesor: **Lopez Goytia Jose Luis** <br/>
> Secuencia: 2NM22 <br/>
> Con la colaboración de: Rodrigo Medina Neri [(@roeeyn)](https://github.com/roeeyn)

---

## Recuerda instalar el Backend de este proyecto para que puedas hacer funcionar el código sin ningún problema: 
## [Poke Proyecto Backend](https://github.com/MikeFranco/PokeProyectoBack)
---

## Para poder instalar todas las dependencias requeridas, favor de tener instalado:

## [Git](https://es.atlassian.com/git/tutorials/install-git), [Yarn](https://yarnpkg.com/en/docs/install#debian-stable) y [NodeJs](https://nodejs.org/es/download/package-manager/) 
---

## Para poder ejecutar el código, seguir los siguientes comandos en la terminal

``` bash
# Clonar el repositorio para tener acceso al código:
$ git clone https://github.com/MikeFranco/PokeProyectoNuxt.git

# Una vez clonado el repositorio:
$ cd PokeProyectoNuxt

# Instalar dependencias:
$ yarn install

# Poder correr el código localmente en el localhost:3333
$ yarn dev
```

# URL de la página en la web:
<h2> <a href="https://poke-proyecto-front.herokuapp.com/?id=151"> poke-proyecto</a> </h1>

---
<h1> ¿Cómo deployar con Heroku el frontend? </h1>
<h2>
  Antes de hacer el deploy, checar los comentarios del componente <b> Home </b> de las    líneas 42 y 64
</h2>
<h2>Una vez que hayas hecho la instrucción anterior, en una terminal ejecuta:</h2>

```bash
# Crear la imagen de docker
$ heroku container:push --app=poke-proyecto-front web
# Subir la nueva imagen de docker a Heroku
$ heroku container:release --app=poke-proyecto-front  web
```

### Las carpetas de **components y pages** tienen su propio README
