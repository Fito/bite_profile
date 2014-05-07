BiteProfile.Views.DietChoice = NailPolish.View.extend({
  templateName: 'bite_profile/diet_choice',
  parentSelector: '.diet-choices',

  addListeners: {
    'click .diet-choice': 'switchOption'
  },

  switchOption: function() {
    this.$('.prohibition').toggleClass('hidden');
    this.exclusions.push(this.model.option);
  }
});
