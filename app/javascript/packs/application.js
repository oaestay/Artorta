/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import './application_styles';

import Vue from '@vue';
import VModal from 'vue-js-modal';
import * as VueGoogleMaps from 'vue2-google-maps'

import BaseModal from '@/components/modal.vue';
import Navbar from '@/components/navbar.vue';

const isProduction = process.env.NODE_ENV === 'production';

const loggerOptions = {
  isEnabled: true,
  logLevel: isProduction ? 'fatal' : 'debug',
  stringifyArguments: false,
  showLogLevel: true,
  showMethodName: true,
  separator: '|',
  showConsoleColors: true,
};

Vue.use(VModal);
Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyDrDbyYKaGv3pufERE1Zab0qvkFp9Zf8r8',
    libraries: 'places',
  },
  installComponents: true
})

Vue.component('base-modal', BaseModal);
Vue.component('navbar', Navbar);

document.addEventListener('turbolinks:load', () => {
  if (document.getElementById('app') !== null) {
    new Vue({
      el: '#app',
      methods: {
        openModal(data = {}) {
          if (!this.$root.$refs.modal) return;

          this.$root.$refs.modal.setData(data);
          this.$root.$refs.modal.openModal();
        }
      }
    });
  }
});
