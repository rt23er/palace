// import shop from '../../api/shop'

// initial state
const state = {

    activeMenuName:'个人资料'
}

// getters
const getters = {}

// actions


// mutations
const mutations = {
   MODIFYNAME(state , payload) {
       state.activeMenuName = payload ;
   }

}
const actions = {
    modifyMenuName({commit} ,payload) {
        commit(MODIFYNAME , payload) ;

    }
}
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}
