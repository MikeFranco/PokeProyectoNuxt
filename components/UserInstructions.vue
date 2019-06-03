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
              Para comenzar a buscar Pokemones: <br/>
              Puedes escoger buscar uno entre los 802 pokemones disponibles ingresando su id en el recuadro verde y presionando <b> Enter </b> 
              <br/><br/><br/><br/><div class="square-button-left"> <input id="nb" type="text" maxlength="3" ><br/><br/></div>
              También, puedes buscarlo agregando su id en el mismo recuadro y persionando el botón verde:
              <div class="green-button-left" ></div>
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

$red: #C00D0D;
$green: #30DA0C;
$light-green: #ACFB76;
$dark-green: #137604;
$leaf-green: #004846;
$light-leaf-green: #008477;

@mixin linear-gradient($color1, $color2) {
  background: linear-gradient($color1, $color2);
}

.square-button-left {
  position: absolute;
  left: 175px;
  bottom: 115px;
  z-index: 130;
  border-radius: 10px;
  height: 55px;
  width: 115px;
  box-shadow: 0 0 20px $leaf-green inset, 0px 0px 5px 1px darken($red, 20%) ;
  background-color: $light-leaf-green;
  @include linear-gradient($light-leaf-green, $leaf-green);
}

.green-button-left {
  @include linear-gradient($green, $dark-green);
  position: absolute;
  z-index: 130;
  border-radius: 100px;
  left: 200px;
  height: 12px;
  width: 50px;
  box-shadow: -1px 1px 0px 1px darken($dark-green, 15%);
  cursor: pointer;
}

.green-button-left:active {
  box-shadow: none;
  @include linear-gradient(darken($green, 40%), $green);
  box-shadow: 0px 0px 10px 3px darken($green, 20%) inset;
  border: darken($green, 30%) solid 1px;
}

</style>
