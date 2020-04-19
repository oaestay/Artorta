<template lang="html">
  <div class="modal">
    <modal
      :name="`${name || this._uid}`"
      height="auto"
      :classes="['v--modal', 'modal__modal']"
      :adaptive="true"
      :scrollable="true"
      width="90%"
      :max-width="600"
      >
      <div class="modal__body">
        <div class="modal__content">
          <a
            href="#"
            class="modal__close-button"
            @click="closeModal"
          >
            <i class="fa fa-2x fa-times"></i>
          </a>
          <h1 class="modal__title" v-if="data.name">{{ data.name }}</h1>
          <img class="modal__image" v-if="data.image_url" :src="data.image_url">
          <h6 class="modal__code" v-if="data.code">Código: {{ data.code }}</h6>
          <h6 class="modal__description" v-if="data.description">{{ data.description }}</h6>
          <p class="modal__price" v-if="data.includes_couple">Incluye pareja de novios</p>
          <div v-if="data.minimum_portions && data.minimum_portions > 0">
            <p class="modal__price">Porciones minimas: {{ data.minimum_portions }}</p>
            <p class="modal__price">Precio por porcion: ${{ data.portion_price }}</p>
          </div>
          <p
            class="modal__price"
             v-if="data.prices"
            v-for="(price, priceIndex) in data.prices"
            :key="`price-${priceIndex}`"
          >{{ price }}</p>
          <p
            class="modal__price"
            v-if="data.warranty"
          >
            Garantia: ${{ data.warranty }}
          </p>
        </div>
      </div>
    </modal>
  </div>
</template>

<script>
export default {
  props: {
    name: { type: String, default: null, required: false },
    close: { type: Function, default: null },
  },
  data () {
    return {
      data: {},
    }
  },
  methods: {
    setData(data) {
      this.data = data;
    },
    openModal() {
      this.$modal.show(`${name || this._uid}`);
    },
    closeModal() {
      if (this.close) {
        this.close();

        return;
      }

      this.$modal.hide(`${name || this._uid}`);
    },
  },
};
</script>

<style lang="scss">
@import '~stylesheets/mixins/variables';

.v--modal-block-scroll {
  overflow: hidden;
}

.modal {
  position: relative;

  &__modal {
    display: flex;
    flex-direction: column;
  }

  &__body {
    overflow-y: auto;
  }

  &__content {
    padding: 25px;
    text-align: justify;
  }

  &__close-button {
    position: absolute;
    color: $font-color;
    line-height: 0;
    top: 15px;
    right: 15px;

    &:hover {
      opacity: 0.6;
    }
  }

  &__title {
    font-size: 24px;
    font-weight: 400;
    margin-top: 0;
  }

  &__image {
    border: 3px solid $dark-color;
    display: block;
    margin: 0 auto;
  }

  &__code,
  &__description {
    margin-top: 10px;
  }

  &__price {
    text-align: center;
  }
}
</style>
