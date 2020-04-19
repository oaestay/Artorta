<template>
  <div class="navbar">
    <a href="/" class="navbar__brand">
      <img :src="brandImage" class="navbar-brand__image" alt="Logo">
    </a>
    <div class="navbar__links">
      <a
        v-for="(link, linkIndex) in links"
        :key="`link-${linkIndex}`"
        :href="link.url"
        >
        {{ link['name'] }}
      </a>
    </div>
    <span class="navbar__trigger" @click="handleTrigger">
      <i class="fa fa-2x fa-bars navbar-trigger__bars" :class="{'navbar-trigger__bars--active': !collapsed}"></i>
    </span>
    <div class="navbar__drawer" :class="{'navbar__drawer--visible': !collapsed}">
      <div class="navbar__mobile-links">
        <a
          v-for="(link, linkIndex) in links"
          :key="`link-${linkIndex}`"
          :href="link.url"
          >
          {{ link['name'] }}
        </a>
      </div>
      <div class="navbar__background-trigger" @click="handleTrigger"></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    brandImage: { type: String },
    links: { type: Array }
  },
  data () {
    return {
      collapsed: true,
    }
  },
  methods: {
    handleTrigger() {
      this.collapsed = !this.collapsed;
    }
  }
}
</script>

<style lang="scss">
.navbar {
  align-items: center;
  background: #24242a;
  display: flex;
  flex-direction: row;
  left: 0;
  height: 50px;
  padding: 10px 20px;
  position: fixed;
  right: 0;
  top: 0;
  z-index: 2;
  color: white;

  @media (max-width: 1080px) {
    justify-content: space-between;
  }

  &__brand {
    height: 40px;
  }

  &__links {
    flex-grow: 1;
    display: flex;
    flex-direction: row;
    justify-content: center;

    @media (max-width: 1080px) {
      display: none;
    }

    & > a {
      color: #fff;
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      text-decoration: none;
      padding: 0 15px;
      transition: all 0.3s ease-in-out;

      &:hover {
        color: #a3a3a3;
      }
    }
  }

  &__drawer {
    top: 70px;
    left: 0;
    right: 0;
    position: absolute;
    max-height: 0;
    overflow: hidden;
    transition: all 0.3s ease-in-out;

    &--visible {
      max-height: 4000px;
    }
  }

  &__mobile-links {
    flex-direction: column;
    display: flex;
    align-items: center;
    background: #24242a;

    &--visible {
      max-height: 500px;
    }

    & > a {
      color: #fff;
      font-size: 14px;
      font-weight: 700;
      text-transform: uppercase;
      text-decoration: none;
      width: 100%;
      text-align: center;
      padding: 5px 0;
      transition: all 0.3s ease-in-out;

      &:hover {
        color: #a3a3a3;
        background: rgba(255, 255, 255, .01);
      }

      &:last-child {
        padding: 5px 0 15px;
      }
    }
  }

  &-brand__image {
    height: 100%;
  }

  &__trigger {
    cursor: pointer;

    @media (min-width: 1079px) {
      display: none;
    }
  }

  &-trigger__bars {
    transition: all 0.3s ease-in-out;

    &:hover {
      color: #a3a3a3;
    }

    &--active {
      color: #c4c4c4;
    }
  }

  &__background-trigger {
    background: transparent;
    left: 0;
    right: 0;
    height: 4000px;
  }
}
</style>
