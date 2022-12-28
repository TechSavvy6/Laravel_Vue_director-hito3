<template>
  <div class="flex flex-col sm:w-full text-base">
    <span class="text-[28px] leading-9 text-center sm:text-left mb-10 sm:mb-8">¡Paga tu membresía</span>
    <div class="flex flex-col w-[736px] sm:w-full px-8 pt-8 sm:px-6 sm:py-5 border-2 border-[#D0D9F1] rounded-lg mb-6 sm:mb-4">
      <div class="flex justify-between mb-10 sm:mb-6">
        <div class="flex">
          <input type="radio" name="payType" v-model="payType" value="card" class="w-6 mr-2 accent-orange" />
          <span class="text-xl sm:text-base mr-2 sm:mr-0">Tarjeta de crédito o débito</span>
          <img src="../../assets/images/icons/mark.svg" class="sm:hidden" alt="">
        </div>
        <span class="text-xl sm:hidden">S/30.00</span>
      </div>
      <div class="flex-col hidden sm:flex">
        <span class="text-sm leading-6">PLAN BÁSICO</span>
        <div class="flex mb-6">
          <img src="../../assets/images/icons/basic.svg" class="mr-2" alt="">
          <span class="text-[#616E8E] flex items-end">Mensual</span>
        </div>
      </div>
      <div class="flex sm:flex-col px-8 sm:px-0">
        <div class="flex flex-col w-[352px] shrink-0 sm:w-full mr-8 sm:mr-0 sm:mb-6">
          <input type="text" v-model="cardHolder" class="h-[52px] w-full px-4  border border-[#8A9CC9] rounded mb-4" placeholder="Titular de la tarjeta" />
          <input type="text" v-model="cardNumber" class="h-[52px] w-full px-4  border border-[#8A9CC9] rounded mb-4" placeholder="Número de tarjeta débito/crédito" />
          <div class="flex justify-between">
            <input type="text" v-model="expireDate" class="h-[52px] w-52 sm:w-[168px] px-4  border border-[#8A9CC9] rounded mb-4" placeholder="Fecha de vencimiento" />
            <input type="text" v-model="cvc" class="h-[52px] w-32 sm:w-[72px] px-4  border border-[#8A9CC9] rounded mb-4" placeholder="CVC" />
          </div>
        </div>
        <div class="flex flex-col">
          <span class="text-sm leading-6 sm:hidden">PLAN BÁSICO</span>
          <div class="flex mb-3 sm:hidden">
            <img src="../../assets/images/icons/basic.svg" class="mr-1" alt="">
            <span class="text-[#616E8E] flex items-end">Mensual</span>
          </div>
          <img src="../../assets/images/icons/mark.svg" class="hidden self-start sm:flex mb-3" alt="">
          <div class="flex mb-2 sm:mb-3">
            <img src="../../assets/images/icons/lock.svg" class="mb-2" alt="">
            <span class="">Pago 100% Seguro</span>
          </div>
          <span class="font-medium text-xs leading-5 pb-2 sm:pb-0">Este sitio cumple con los estándares de seguridad de la industria de medio de pago PCI-DSS para proteger su información personal y la de su tarjeta.</span>
        </div>
      </div>
    </div>
    <div class="flex w-[736px] sm:w-full p-8 sm:px-6 sm:py-5 border-2 border-[#D0D9F1] rounded-lg mb-12 sm:mb-8">
      <div class="flex justify-between">
        <div class="flex">
          <input type="radio" name="payType" v-model="payType" value="wire_transfer" class="w-6 mr-2 accent-orange" />
          <span class="text-xl sm:text-base">Transferencia bancaria</span>
        </div>
        <span class="text-xl sm:hidden">S/30.00</span>
      </div>
    </div>
    <span class="text-2xl text-left sm:hidden mb-6">Para mejorar tu experiencia</span>
    <div class="flex mb-3 sm:hidden">
      <div class="">
        <input type="checkbox" class="accent-orange mr-4 w-6 h-6 flex items-start">
      </div>
      <div class="flex flex-col">
        <span class="text-xl mb-2">Renovación automática 👌</span>
        <span class="font-medium leading-7">Autorizo que Direktor renueve automáticamente el plan seleccionado de manera mensual.</span>
      </div>
    </div>
    <hr class="h-[1px] bg-[#D0D9F1] mb-10 sm:hidden">
    <div class="flex justify-end">
      <button class="w-56 h-12 rounded bg-orange sm:w-full text-white" @click="pay">Pagar</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'third-register-view',
  methods: {
    pay: function() {
      this.$router.push('/register/success')
    }
  },
  computed: {
    payType: {
      get: function() {
        return this.$store.state.registerData.payType;
      },
      set: function(value) {
        this.$store.commit({
          type: 'updateRegisterData',
          attr: 'payType',
          value: value
        });
      }
    },
    cardHolder: {
      get: function() {
        return this.$store.state.registerData.cardInfo.cardHolder;
      },
      set: function(value) {
        this.$store.commit({
          type: 'updateRegisterDataCardInfo',
          attr: 'cardHolder',
          value: value
        });
      }
    },
    cardNumber: {
      get: function() {
        return this.$store.state.registerData.cardInfo.cardNumber;
      },
      set: function(value) {
        this.$store.commit({
          type: 'updateRegisterDataCardInfo',
          attr: 'cardNumber',
          value: value
        });
      }
    },
    expireDate: {
      get: function() {
        return this.$store.state.registerData.cardInfo.expireDate;
      },
      set: function(value) {
        this.$store.commit({
          type: 'updateRegisterDataCardInfo',
          attr: 'expireDate',
          value: value
        });
      }
    },
    cvc: {
      get: function() {
        return this.$store.state.registerData.cardInfo.cvc;
      },
      set: function(value) {
        this.$store.commit({
          type: 'updateRegisterDataCardInfo',
          attr: 'cvc',
          value: value
        });
      }
    },
  }
}
</script>