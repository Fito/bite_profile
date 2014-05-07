BiteProfile.Models.DietExclusions = Backbone.Model.extend({
  urlRoot: function() {
    return 'user/' + BiteProfile.app.repository.user.id + '/diet_exclusions';
  },

  defaults: {
    exclusions: []
  }
});
