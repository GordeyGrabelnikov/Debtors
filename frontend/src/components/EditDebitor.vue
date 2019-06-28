<template>
  <form v-on:submit="onSubmit" class="flex-add">
    <div>
      First name: <br>
      <input type="text" class="input" v-model="firstName" placeholder="First name"/>
    </div>
    <div>
      Last name: <br>
      <input type="text" class="input" v-model="lastName" placeholder="Last name"/>
    </div>
    <div>
      Image: <br>
      <input type="text" class="input" v-model="imageUrl" placeholder="Your photo"/>
    </div>
    <div v-for='debit in debits' v-bind:key="debit.id">
      Debit: 
      <input type="number" class="input" v-model.number="debit.amount" placeholder="Last name"/>
      Date:
      <date-picker v-model="debit.date" valueType="format" lang="en" ></date-picker>
      <img class="icon" src="../assets/delete.svg" v-on:click="deleteDebit(debit)" />
    </div>
    <button type="button" v-on:click="addField" class="button-submit">Add debit</button>
    <div>
      <button type="submit" class="button-submit">Add</button>
      <router-link to="/" class="button-submit">Cancel</router-link>
    </div>
  </form>
</template>

<script>
  import DatePicker from 'vue2-datepicker'
  import { edit, show } from '../debitors-repository'
    export default {
    components: { DatePicker },
    data: () => ({
      firstName: '',
      lastName: '',
      debits: [], 
      imageUrl: ''
    }),
    methods: {
      onSubmit: function(event) {
        event.preventDefault();
          edit({
            id: this.$route.params.id,
            firstName: this.firstName,
            lastName: this.lastName,
            debits: this.debits,
            imageUrl: this.imageUrl,
            }).then(() => this.$router.push("/"));
      },
      addField: function() {
        this.debits.push({
          amount: 0,
          date: ''
        })
      },
      deleteDebit: function(debit) {
        const deleteIndex = this.debits.indexOf(debit);
        this.debits.splice(deleteIndex, 1);
      }
    },
    mounted() {
      if (this.$route.params.id){
        show(this.$route.params.id)
          .then((debtor) => (
            this.firstName = debtor.firstName,
            this.lastName = debtor.lastName,
            this.debits = debtor.debits,
            this.imageUrl = debtor.image
        ))}
    }
  }
</script>



<style>
.flex-add{
  display: flex;
  flex-direction: column;
  font-size: 30px;
  margin-top: 100px;
  align-items: center;
}

.input{
  height: 30px;
  width: 300px;
  font-size: 25px;
  border-radius: 5px;
}

.button-submit{
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
</style>

