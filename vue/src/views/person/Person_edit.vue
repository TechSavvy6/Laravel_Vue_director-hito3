<template>
  <div class="flex justify-between sm:flex-col px-40">
    <span class="text-2xl mb-2">Hola , {{info_person[0].name}}</span>
  </div>

  <div class="flex justify-between sm:flex-col px-40 ">
    <img
        :src="img_source"
        :class="{
          'img-size': true,
          'img-square': true,
          'img-circular': true,
        }"
      />


  </div>
  <nav><br></nav>
  <div class="flex justify-between sm:flex-col px-40">
    <div
      class="flex flex-col h-10 text-[#616E8E] group cursor-pointer px-5"
      @click="handleClick('edit')"
    >

    <input
                                        hidden
                                        type="file"
                                        ref="photoFile"
                                        accept=".jpg, .jpeg, .png"
                                        @change="addPerfilPhoto"
                                    />
      <img
        src="../assets/images/icons/tooltip-edit.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-editActive"
      />
      <w-btn class="text-[18px] leading-3 group-hover:text-orange" @click="$refs.photoFile.click()"
        >
        Editar
      </w-btn>
    </div>
  </div>

  <br><br>
  <div class="flex justify-between sm:flex-col px-40">
  <div class="flex flex-col w-[48%] sm:w-full">
    <!-- <span class="text-2xl mb-2">Nombre</span>
    <span class="mb-8">{{info_person[0].name}}</span> -->
    <input
    type="text"
    name=" nombre"
    v-model="info_person[0].name"
    :errors="errors"
    placeholder="Ingresar Nombre"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">

    <br/>
    <input
    type="text"
    name="celular"
    v-model="info_person[0].celular"
    :errors="errors"
    placeholder="Ingresar Celular"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">
    <br/>
    <input
    type="text"
    name="codcargo"
    v-model="info_person[0].codCargo"
    :errors="errors"
    placeholder="Ingresar Cargo"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">

  </div>
  <div class="flex flex-col w-[48%] sm:w-full">
    <input
    type="text"
    name="lastname"
    v-model="info_person[0].lastname"
    :errors="errors"
    placeholder="Ingresar Nombre"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">
    <br/>
    <input
    type="text"
    name="nombreempresa"
    v-model="info_person[0].nombreempresa"
    :errors="errors"
    placeholder="Ingresar Nombre"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">
    <br/>
    <input
    type="text"
    name="email"
    v-model="info_person[0].email"
    :errors="errors"
    placeholder="Ingresar Nombre"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">
    <br>
    <br>

  </div>

</div>

<div class="flex flex-col w-[100%] sm:w-full">

<div class="seperator w-300">
  <h5></h5>
</div>

</div>
<br>
<div class="flex justify-between sm:flex-col px-40">

  <div class="flex flex-col w-[48%] sm:w-full">

</div>
<div class="flex flex-col w-[48%] sm:w-full">

  <div class="flex justify-between sm:flex-col px-40">
    <button class=" h-14 sm:w-full bg-orange text-white text-base px-8 rounded"
    @click="personEditar">Guardar Cambios</button>
</div>

</div>

</div>


</template>

<script setup>
import store from "../../store";
import { useRouter } from "vue-router";
import { computed, ref } from "vue";


store.dispatch("get_infoPerson",{

});
const info_person = computed(() => store.state.infoPerson.data);
const img_source  = computed(() => store.state.infoPerson.img);
const router      = useRouter();
const user = {
  id:"",
  celular:"",
  name: "",
  email: "",
  lastname:"",
  nombreempresa:"",
  codcargo: 0
};

// computed(()=>{
//    user.name = store.state.infoPerson.data_save.name
//    console.log(user.name)
// });

function personEditar(){

  router.push({
        name: "person_edit",
      });

}

// items =  [
//       { name: 'Foo' },
//       { name: 'Bar' }
//     ]
// items.push()



// let person = {

// };

</script>

<style>
.img-size {
  height: 100px;
}

.img-square {
  border-radius: 0;
  transition: all 0.2s;
}

.img-circular {
  border-radius: 50%;
  transition: all 0.2s;
}

.seperator h5 {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 1em;
}

.seperator h5::before,
.seperator h5::after {
  content: "";
  display: block;
  flex-grow: 1;
  height: 1px;
  background: #ccc;
}

.seperator h5 span {
  padding: 0 2em;
}
</style>
