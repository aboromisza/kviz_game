<template>
    <div :class="{ 'alert alert-danger m-1': showModal }">
      <b-modal v-model="showModal" title="Hibaüzenet">
        
        <p >{{ errorMessage }}</p>
      </b-modal>
    </div>
  </template>
  
<script>

export default {

/* components: {  Valamiért még panaszkodik, figyelmeztetést küld a modal meghívása esetén
    BModal,
  }, */

  data() {
    return {
      showModal: false,
      errorMessage: ""
    };
  },
  methods: {
    displayError(message) {
      this.errorMessage = message;
      this.showModal = true;
      setTimeout(() => {
        this.showModal= false;
        this.errorMessage= "";
      },  1000);
    }
  },

};
</script>

<style scoped>
  .bold-red-text {
    font-weight: bold;
    color: red;
  }
  
</style>