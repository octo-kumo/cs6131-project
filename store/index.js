import { get } from '~/plugins/api'

export const state = () => ({
  user: null,
  containers: null
})

export const mutations = {
  user (state, user) {
    state.user = user
  },
  containers (state, containers) {
    state.containers = containers
  }
}

export const actions = {
  populate ({ commit }) {
    return Promise.all([
      get('/api/auth').then(data => commit('user', data.user)),
      get(`/api/c/`).then(data => commit('containers', data.containers))
    ])
  }
}
