<template>
  <div class="hello">
    <img src="../assets/images/background.png">

    <div class="barraBusqueda">
      <h3>Ingrese el ID del pokemon:</h3>
      <input style="color: black" type="text" v-model="specificId" maxlength="3" @keyup.enter="sendSpecificID()">
    </div>

    <div class="pokealeatorio">

      <div class="botonshowpoke"> <button style="color: black" @click="pokemonRandom()">Show Pokemon Random</button>  </div>
      <PokeCard v-if="isPokemonRandomShown" :pokemon="pokemonRandomInfo" />
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
      this.$axios.post('http://localhost:6001/verPokemones')
        .then(response =>{
          this.pokemonRandomInfo = response.data;
          this.isPokemonRandomShown = true;
        })
        .catch(err => this.$noty.error(err))
    },
    sendSpecificID(){
      this.specificId == ''
        ? this.$noty.error('Favor de ingresar un ID')
        : this.specificId <= 802
          ? this.specificPokemon()
          : this.$noty.error(`El pokemon con id ${this.specificId} no está registrado en la Pokedex`);
    },

    specificPokemon(){
      this.$axios.get('http://localhost:6001/pokemonEspec', { params:{ id : this.specificId } })
        .then(response =>{
          this.pokemonSpecificInfo = response.data;
          this.isPokemonSpec = true;
        })
        .catch(err => this.$noty.error(err));
    }

  },
  components:{
    PokeCard
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
