<template>
  <div >
  <p>
    <img :src="pokemon.image"/>
    <br>Un {{pokemon.name}} ha aparecido<br>
    El id del pokemon es: {{pokemon.id}}<br>
    ¡Cuidado!, {{pokemon.name}} ha usado: {{pokemon.move}}<br>
  </p>
  </div>
</template>

<script>
export default {
  props:[
    'pokemon'
  ]

}
</script>

<style>

</style>
