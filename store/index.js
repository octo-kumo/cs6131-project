export const state = () => ({
  user: null
})

export const mutations = {
  user (state, user) {
    state.user = user
  }
}

export const actions = {
  populate ({ commit }) {
    fetch('/api/auth').then(res => res.json()).then(data => commit('user', data.user))
  },
  nuxtServerInit ({ commit }, { req }) {
    if (req.session && req.session.user) {
      commit('user', req.session.user)
    }
  }
}
