// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import Axios from 'axios'

import messageUI from './assets/js/message';
import ElementUI from 'element-ui';
// import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI);
Vue.prototype.HOST = 'http://localhost:4000'
Vue.prototype.$axios = Axios

Vue.config.productionTip = false
Vue.prototype.$message = messageUI;

new Vue({
    el: '#app',


    render: h => h(App),

    router,
    components: { App },
    template: '<App/>'

})