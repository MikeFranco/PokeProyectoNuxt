<template>
  <div class="hello">
    <img src="../assets/images/background.png">

    <div class="instructions" >
      <UserInstructions />
    </div>

    <div class="pokealeatorio">
      <PokeCard
        :getSpecificPokemon="sendSpecificID"
        :pokemon="pokemonSpecificInfo"
        :pokemonRandom="pokemonRandom"
      />
    </div>

  </div>
</template>

<script>
import axios from "axios";
import PokeCard from "~/components/PokeCard.vue";
import UserInstructions from "~/components/UserInstructions.vue";

export default {
  components: {
    PokeCard,
    UserInstructions
  },
  data() {
    return {
      specificId: "",
      isPokemonRandomShown: false,
      isPokemonSpec: false,
      pokemonRandomInfo: undefined,
      pokemonSpecificInfo: undefined
    };
  },
  methods: {
    pokemonRandom() {
      //Antes de deployar el frontend, descomentar la línea 45 y comentar la 44 para poder usar el backend deployado en heroku
      //this.$axios.get("http://localhost:6001/get-random-pokemon")
      this.$axios.get("https://poke-proyecto.herokuapp.com/get-random-pokemon")
        .then(response => {
          this.pokemonSpecificInfo = response.data;
          this.isPokemonRandomShown = true;
        })
        .catch(err => console.error(err));
    },
    sendSpecificID(specificId) {
      specificId == ""
        ? this.$noty.error("Favor de ingresar un ID")
        : this.specificId <= 802
        ? this.getSpecificPokemon(specificId) || (this.$router.push({path: this.$route.path, query: { id: specificId }}))
        : this.$noty.error(`El pokemon con id ${this.specificId} no está registrado en la Pokedex`);
    },

    getSpecificPokemon(pokemonId) {
      /*Antes de deployar el frontend, descomentar las líneas de código 66 a 68 y comentar de la
        63 a la 65 para poder usar el backend deployado en heroku
      */
      //this.$axios.get("http://localhost:6001/get-specific-pokemon", {
      //    params: { id: pokemonId }
      //  })
      this.$axios.get("https://poke-proyecto.herokuapp.com/get-specific-pokemon", {
          params: { id: pokemonId }
        })
        .then(response => {
          this.pokemonSpecificInfo = response.data;
          this.isPokemonSpec = true;
        })
        .catch(err => console.error(err));
    }
  }
};
</script>


<style scoped>
button {
  text-align: center;
  margin: 40px 0 0;
  background-color: rgb(9, 173, 238);
  border-radius: 10px;
}
p {
  text-align: center;
}
.barraBusqueda {
  text-align: start;
  position: absolute;
  top: 0px;
  left: 350px;
}

.botonshowpoke {
  padding-top: 50px;
}
input {
  border-radius: 15px;
}
.pokealeatorio {
  position: absolute;
  top: 200px;
  left: 200px;
}
.pokeID {
  margin-top: 128px;
  position: absolute;
  top: 150px;
  left: 50%;
}

.instructions {
  position: absolute;
  top: 40px;
  left: 80px;
}
</style>
