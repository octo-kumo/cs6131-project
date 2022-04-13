export default {
  sockets: [
    {
      name: 'home',
      url: 'http://localhost:3000',
      default: true,
      vuex: {
        // mutations: [
        //   {
        //     progress: 'examples/SET_PROGRESS'
        //   },
        //   'progress --> examples/SET_PROGRESS'],
        // actions: [
        //   'chatMessage --> FORMAT_MESSAGE',
        //   'SOMETHING_ELSE'
        // ]
      }
    }
  ]
}
