<template>
  <div class="hello">
    <img src="../assets/images/background.png">

    <div class="barraBusqueda">
      <h3>Ingrese el ID del pokemon:</h3>
      <input style="color: black" type="text" v-model="specificId" maxlength="3" @keyup.enter="sendSpecificID()">
    </div>

    <div class="pokealeatorio">
      <PokeCard v-if="isPokemonRandomShown"
        :pokemon="pokemonRandomInfo"
        :pokemonRandom="pokemonRandom"
        :specificPokemon="sendSpecificID"
      />
    </div>

    <div class="pokeID">
      <PokeCard v-if="isPokemonSpec" :pokemon="pokemonSpecificInfo" />
    </div>
    </div>

</template>

<script>
import axios from 'axios';
import PokeCard from '~/components/PokeCard.vue';

export default {
  components:{
    PokeCard
  },
  data(){
    return {
      specificId: '',
      isPokemonRandomShown: false,
      isPokemonSpec: false,
      pokemonRandomInfo: {},
      pokemonSpecificInfo: {}
    }
  },
  methods: {
    pokemonRandom(){
      this.$axios.get('https://poke-proyecto.herokuapp.com/get-random-pokemon')
        .then(response =>{
          this.pokemonRandomInfo = response.data;
          this.isPokemonRandomShown = true;
        })
        .catch(err => console.error(err));
    },
    sendSpecificID(specificId){
      specificId == ''
        ? this.$noty.error('Favor de ingresar un ID')
        : this.specificId <= 802
          ? this.specificPokemon()
          : this.$noty.error(`El pokemon con id ${this.specificId} no está registrado en la Pokedex`);
    },

    specificPokemon(){
      this.$axios.get('https://poke-proyecto.herokuapp.com/get-specific-pokemon', { params:{ id : this.specificId } })
        .then(response =>{
          this.pokemonSpecificInfo = response.data;
          this.isPokemonSpec = true;
        })
        .catch(err => this.$noty.error(err));
    }
  },
  created(){
    this.pokemonRandom();
  }
}
</script>


<style scoped>
button {
  text-align: center;
  margin: 40px 0 0;
  background-color: rgb(9, 173, 238);
  border-radius: 10px;
}
p{
  text-align:center;
}
.barraBusqueda{
  text-align: start;
  position: absolute;
  top: 0px;
  left: 350px;
}

.botonshowpoke{
  padding-top: 50px;
}
input{
  border-radius: 15px;
}
.pokealeatorio{
  position: absolute;
  top: 150px;
  left: 150px;
}
.pokeID{
  margin-top: 128px;
  position: absolute;
  top: 150px;
  left: 50%;
}
</style>
