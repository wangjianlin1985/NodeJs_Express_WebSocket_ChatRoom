import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)
import Login from '../components/dialog/Login.vue'
import Register from '../components/dialog/Register.vue'
import chat from '../components/dialog/chat.vue'
import lr from '../components/dialog/lr.vue'
const router = new VueRouter({
    routes: [
        { path: '/', redirect: '/login' },
        { path: '/login', component: Login },
        { path: '/lr', component: lr },
        { path: '/register', component: Register },
        {
            path: '/chat',
            component: chat,
            meta: {
                loginRequest: true
            }
        },
    ]
})
export default router