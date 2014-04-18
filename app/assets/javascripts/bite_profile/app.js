BiteProfile.App = NailPolish.App.extend({
  bootstrap: function () {
    var data = this.bootstrapData(this.bootstrapDataSelector);
    var repository = {
      user: new BiteProfile.Models.User(data)
    };

    return repository;
  },

  routerClass: function() {
    return BiteProfile.Router;
  }
});
