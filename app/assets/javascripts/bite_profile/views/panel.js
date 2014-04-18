BiteProfile.Views.Panel = NailPolish.View.extend({
  templateName: 'bite_profile/panel',
  className: 'panel',

  afterRender: function() {
    var modal;
    if (!this.model.get('active')) {
      modal = new BiteProfile.Views.ChoicesModal();
      modal.render();
    }
  }
});