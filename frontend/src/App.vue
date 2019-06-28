<template>
  <div id="app">

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app',
}
</script>





<style>
#debitorsList {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: initial;
  width: 100%;
}

#debitorsList tr:hover {background-color: #ddd;}

#debitorsList th, #debitorsList tr{
  padding: 8px;
}

#debitorsList th{
  padding-top: 12px;
  padding-bottom: 12px;
  text-align:left;
  background-color: blue;
  color: white;
}
</style>




