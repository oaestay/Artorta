const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader');
const vue = require('./loaders/vue');
const vueResolver = require('./resolve/vue');
const customConfig = require('./custom');

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());
environment.loaders.prepend('vue', vue);

const nodeModulesLoader = environment.loaders.get('nodeModules');
if (!Array.isArray(nodeModulesLoader.exclude)) {
  nodeModulesLoader.exclude = (nodeModulesLoader.exclude === null) ? [] : [nodeModulesLoader.exclude];
}

environment.config.merge(vueResolver);
environment.config.merge(customConfig);
module.exports = environment
