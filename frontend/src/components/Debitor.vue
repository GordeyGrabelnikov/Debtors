<template>
  <div class="flex-show">
    <div>
      <img class="avatarProfile" v-bind:src="image" alt="Image">
    </div>
    <div>
      First name: {{firstName}}
    </div>
    <div>
      Last name: {{lastName}}
    </div>
    <div v-for='debit in debits' v-bind:key="debit.id">
      Debit: {{debit.amount}} Date: {{debit.date}} 
    </div>
    <router-link to="/" class="button-cancel">Back</router-link>
  </div>
</template>

<script>
  import { show } from '../debitors-repository'

  export default {
    data: () => ({
      firstName: '',
      lastName: '',
      debits: [],
      image: ''
    }),
    mounted() {
      show(this.$route.params.id)
        .then((debtor) => (
      this.firstName = debtor.firstName,
      this.lastName = debtor.lastName,
      this.debits = debtor.debits,
      this.image = debtor.image
      ))
    }
  }
</script>

<style>
.flex-show{
  flex-direction: column;
  color: #2F4F4F;
  font-size: 30px;
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  text-align: center;
  margin-top: 100px;
}

.button-cancel{
  width: 100px;
  border: 1px solid green;
  border-radius: 5px;
  font-size: 20px;
  padding: 3px 5px;
  text-align: center;
  color: white;
  background-color: #4CAF50;
  text-decoration: none;
  cursor: pointer;
}

.avatarProfile{
  width: 200px;
  height: 220px;
  object-fit: contain;
}
</style>
