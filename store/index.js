import { get } from '~/plugins/api'

export const state = () => ({
  user: null,
  users: null,
  containers: null
})

export const mutations = {
  user (state, user) {
    state.user = user
  },
  users (state, users) {
    state.users = users
  },
  containers (state, containers) {
    state.containers = containers
  }
}

export const actions = {
  populate ({ commit }) {
    return Promise.all([
      get('/api/auth/').then(data => commit('user', data.user)),
      get('/api/u/').then(data => commit('users', data.users)),
      get(`/api/c/`).then(data => commit('containers', data.containers))
    ]).catch((e) => {
      console.error(e)
      if (e === 'not logged in' && location.pathname !== '/login') {
        // location.href = '/login'
      }
    })
  }
}
