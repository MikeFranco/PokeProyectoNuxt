# COMPONENTS

Esta carpeta contiene todos los componentes de Vue.js que vayas creando, recuerda que es buena práctica tener un componente por cada "herramienta" que vayas a utilizar

## Home.vue
Es el componente principal, aquí están agregados los componentes de **PokeCard y User Instructions**.
Contienen las peticiones al backend para que se puedan consultar a los pokemones. Recuerda que antes de hacer deploy, tienes que cambiar la petición de axios para que uses el backend que está desplegado en Heroku y no el local

## PokeCard.vue
Este componente contiene a la pokedex, en este componente se encuentra el poder ver a cada pokemon de manera individual.
Dentro de los ***props*** de este componente, están el *"pokemon"*, que es la información del pokemon que manda el backend para que este componente lo pueda mostrar. *"pokemonRandom"* es para poder hacer la petición al backend para obtener en la Pokedex a un pokemon aleatorio dentro de los 802 existentes. *"getSpecificPokemon"* es la función que valida el número del pokemón que quieres ver, para después poder hacer la petición al backend; esta función es la misma que *"sendSpecificID"* dentro del componente de **"Home"**.

## UserInstructions.vue
En este componente están contenidas dentro de un *"dialog"* las instrucciones para que el usuario pueda usar de manera adecuada el juego.

