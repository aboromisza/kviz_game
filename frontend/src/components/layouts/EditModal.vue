<template>
    <div
      class="modal fade"
      tabindex="-1"
      aria-labelledby="editModal"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5"> {{item.name}} szerkesztése</h1>
            <button class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label class="form-label" :for="`name-${item.id}`">Név</label>
              <input type="text" class="form-control" :id="`name-${item.id}`" :name="`name-${item.id}`" v-model="modifiedQuestion.name">
            </div>
            <div class="form-group">
              <label class="form-label" :for="`imagePath-${item.id}`">Fájl helye</label>
              <input type="text" class="form-control" :id="`imagePath-${item.id}`" :name="`imagePath-${item.id}`" v-model="modifiedQuestion.imagePath">
            </div>
            <div class="form-group">
              <label class="form-label" :for="`answer1-${item.id}`">Válasz 1</label>
              <input type="text" class="form-control" :name="`answer1-${item.id}`" :id="`answer1-${item.id}`" v-model="modifiedQuestion.answer1">
            </div>
            <div class="form-group">
              <label class="form-label" :for="`answer2-${item.id}`">Válasz 2</label>
              <input type="text" class="form-control" :name="`answer2-${item.id}`" :id="`answer2-${item.id}`" v-model="modifiedQuestion.answer2">
            </div>
            <div class="form-group">
              <label class="form-label" :for="`answer3-${item.id}`">Válasz 3</label>
              <input type="text" class="form-control" :name="`answer3-${item.id}`" :id="`answer3-${item.id}`" v-model="modifiedQuestion.answer3">
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" data-bs-dismiss="modal">Bezárás</button>
            <button class="btn btn-primary"  @click="$emit('modifyQuestion', modifiedQuestion)" data-bs-dismiss="modal">Mentés</button>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script>
  export default {
    name: 'EditModal',
    
    props: {
      item: Object,
    },
    data() {
      return {
        modifiedQuestion: {
          id: this.item.id,
          name: this.item.name,
          picture: this.item.picture,
          answer1: this.item.answer1,
          answer2: this.item.answer2,
          answer3: this.item.answer3,
          imagePath: this.item.imagePath
        },
      };
    },
    emits: ['modifyQuestion']
  };
  </script>
  <style></style>
  