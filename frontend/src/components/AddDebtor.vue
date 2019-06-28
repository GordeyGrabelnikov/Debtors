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
      <input type="text" v-model="imageUrl"  class="input"  placeholder="Your photo"/>
    </div>
    <div class='flex'>
        <div>
            Debit: 
            <input type="number"  v-model.number="debit" placeholder="How much?"/>
        </div>
        <div>
            Date: 
            <date-picker v-model="date" valueType="format" lang="en" ></date-picker>
        </div>
    </div>
    <div>
      <button type="submit" class="button-submit">Add</button>
      <router-link to="/" class="button-submit">Cancel</router-link>
    </div>
  </form>
</template>

<script>
    import DatePicker from 'vue2-datepicker'
    import { add } from '../debitors-repository'
    
    export default {
    components: { DatePicker },
    data: () => ({
      firstName: '',
      lastName: '',
      imageUrl: '',
      debit: 0,
      date: ''
    }),
    methods: {
      onSubmit: function(event) {
        event.preventDefault();
        add({
        firstName: this.firstName,
        lastName: this.lastName,
        debit: this.debit,
        date: this.date,
        imageUrl: this.imageUrl
        }).then(() => this.$router.push("/"));
        }
    }
  }
</script>
