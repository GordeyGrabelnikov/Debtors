<template>
  <div >
    <table id="debitors-list" cellspacing="0"> 
      <tr>
        <th></th>
        <th>Full name</th>
        <th>Debit</th>
        <th>
          <a href="#/add/" class="button-add">Add</a>
        </th>  
      </tr>
      <tr v-for='debtor in debtors' v-bind:key="debtor.id">
        <td>
          <img v-bind:src="debtor.image" class="avatar">
        </td>
        <td>
          {{debtor.firstName}} {{debtor.lastName}} 
        </td>
        <td>
          {{debtor.debit}}
        </td>
        <td>
          <div class="flex">
          <div>
            <a v-bind:href='"#/show/" + debtor.id' >
              <img src="../assets/eye.svg" class="icon"/>
            </a>
          </div>
          <div>
            <a v-bind:href='"#/edit/" + debtor.id'>
              <img src="../assets/pencil-edit-button.svg" class="icon" />
            </a>
          </div>
          <div><img class="icon" src="../assets/delete.svg" v-on:click="onClick(debtor)" /></div>
          </div>        
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          Total:
        </td>
        <td>
          {{sum}}
        </td>
        <td>
        </td>
      </tr>
    </table>
  </div>
</template>





<script>
  
  import { getAll, del } from '../debitors-repository'

  export default {
    data: () => ({
      debtors: []
    }),
    methods: {
      onClick: function(debtor) {
        del(debtor)
          .then(() => getAll())
          .then((debtors) => this.debtors = debtors)
      }
    },
    computed: {
      sum: function(){
        let initialValue = 0;
        let result = this.debtors.reduce((accumulator, currentValue) => accumulator + +currentValue.debit, initialValue);
        return result;
      }
    },
    mounted() {
      getAll().then((debtors) => this.debtors = debtors)

    }
  }
  
</script>







<style>

body{
  background-color:#87CEFA;
}

#debitors-list {
  margin: auto;
  color: #2F4F4F;
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  width: 60%;
}

#debitors-list td{
  padding: 8px 8px;
}

#debitors-list tr{
  background-color: white;
}

#debitors-list tr:hover {background-color: #AFEEEE;}

#debitors-list th{
  padding: 8px;
  padding-top: 12px;
  padding-bottom: 12px;
  text-align:left;
  background-color: #7B68EE;
  color: white;
}

#debitors-list th:first-child {
  border-top-left-radius: 10px;
}

#debitors-list th:last-child{
  border-top-right-radius: 10px;
}

#debitors-list tr:last-child td:last-child{
 border-bottom-right-radius: 10px;
}

#debitors-list tr:last-child td:first-child{
  border-bottom-left-radius: 10px;
}

#debitors-list tr:last-child{
  background-color:#C0C0C0;
}

.button {
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 15px;
  width: 100px;
  padding: 3px;
  border: 1px solid green;
  border-radius: 5px;
  cursor: pointer;
}

.button-add{
float: right;
border: 1px solid green;
border-radius: 5px;
font-size: 20px;
text-align: center;
padding: 3px 5px;
color: white;
background-color: #4CAF50;
text-decoration: none;
}

.flex{
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  flex-wrap: wrap;
  align-content: space-around;
}

.icon{
  width: 25px;
  height: 25px;
  cursor: pointer;
}

.avatar{
  height: 60px;
  width: 60px;
  border-radius: 100%;
  object-fit: cover;
}

</style>
