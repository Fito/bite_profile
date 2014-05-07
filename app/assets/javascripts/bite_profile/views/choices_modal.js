BiteProfile.Views.ChoicesModal = NailPolish.Widget.Modal.extend({
  templateName: 'bite_profile/choices_modal',

  addListeners: {
    'click .ok-button': 'submitChoices'
  },

  dietOptions: ['Gluten', 'Sugar', 'Seafood'],

  subviews: function() {
    var views = _.map(this.dietOptions, function(option) {
      return this.viewForOption(option);
    }.bind(this));

    return views;
  },

  viewForOption: function(option) {
    var view = new BiteProfile.Views.DietChoice({model: {option: option}});
    view.exclusions = this.model.get('exclusions');
    return view;
  },

  submitChoices: function() {
    this.model.save();
    this.close();
  }
});
