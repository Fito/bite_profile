BiteProfile.Views.ChoicesModal = NailPolish.Widget.Modal.extend({
  templateName: 'bite_profile/choices_modal',

  addListeners: {
    'click .ok-button': 'close'
  }
});