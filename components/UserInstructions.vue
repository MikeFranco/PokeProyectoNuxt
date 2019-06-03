<template>
  <div id="app">
    <v-app id="inspire">
      <div class="text-xs-center">
        <v-dialog v-model="dialog" width="500">
          <template v-slot:activator="{ on }">
            <v-btn class="buttonInstructions" color="error lighten-2" dark v-on="on" style="position: fixed;" >Instrucciones</v-btn>
          </template>

          <v-card>
            <v-card-title class="headline grey lighten-2" primary-title>Bienvenido, Maestro Pokemon</v-card-title>

            <v-card-text>¿Listo para buscar a todos los pokemones? Estos son los botones con los que puedes usar para buscarlos<br/><br/>
              Para comenzar a buscar Pokemones de manera aleatoria, <br/> presiona el boton azul dentro del pokedex-> <div class="blue-button-left" ></div>
            </v-card-text>

            <v-divider></v-divider>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" flat @click="dialog = false">¡Vamos a buscar Pokemon's!</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </div>
    </v-app>
  </div>
</template>

<script>
export default {
  data(){
    return{
      dialog: false
    }
  }
};
</script>

<style scoped lang="scss" >
$blue: #2D77F9;
$dark-blue: #0530E5;
$black: #222222;

@mixin linear-gradient($color1, $color2) {
  background: linear-gradient($color1, $color2);
}

.blue-button-left {
  @include linear-gradient($blue, $dark-blue);
  position: absolute;
  z-index: 130;
  top: 125px;
  right: 30px;
  border-radius: 100px;
  height: 55px;
  width: 55px;
  box-shadow: 0px 1px 0px 1px darken($dark-blue, 20%);
  cursor: pointer;
}

.blue-button-left:active {
  box-shadow: none;
  @include linear-gradient(darken($blue, 40%), $blue);
  box-shadow: 0px 0px 10px 3px darken($dark-blue, 10%) inset;
  border: $black solid 1px;
}


</style>
