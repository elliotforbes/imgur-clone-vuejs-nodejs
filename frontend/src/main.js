import Vue from 'vue'
import App from './App.vue'
import cognitoAuth from './cognito'
import router from './router'

Vue.config.productionTip = false

new Vue({
  router,
  cognitoAuth,
  render: h => h(App),
}).$mount('#app')
