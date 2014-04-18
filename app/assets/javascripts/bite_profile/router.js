BiteProfile.Router = NailPolish.Router.extend({
  init: function() {
    this.$el = $('.main-content');
  },

  routes: {
    '*wildcard': 'userPanel'
  },

  userPanel: function() {
    this.page([
      new BiteProfile.Views.Panel({model: this.repository.user})
    ])
  }
});