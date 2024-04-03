import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({

    state: {
        show: false,
    },
    mutations: {
        hide(state) {
            state.show = false;
        },
        showing(state) {
            state.show = true;
        },
    },
    actions: {}


})


