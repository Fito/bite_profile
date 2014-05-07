BiteProfile.Views.Panel = NailPolish.View.extend({
  templateName: 'bite_profile/panel',
  className: 'panel',

  afterRender: function() {
    if (!this.model.get('active')) {
      var dietExclusions = new BiteProfile.Models.DietExclusions();
      var modal = new BiteProfile.Views.ChoicesModal({model: dietExclusions});
      modal.render();
    }
  }
});
