import Debitor from './components/Debitor';
import DebitorList from './components/DebitorList';
import EditDebitor from './components/EditDebitor';
import AddDebtor from './components/AddDebtor';
import VueRouter from 'vue-router';
import Vue from 'vue';

const routes = [
    {path: '/edit/:id', component: EditDebitor},
    {path: '/show/:id', component: Debitor},
    {path: '/add', component: AddDebtor},
    {path: '/', component: DebitorList}
]

const router = new VueRouter({
    routes
})
Vue.use(VueRouter);
export default router;
