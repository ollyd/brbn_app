BrbnApp.Views.BourbonView = Backbone.Marionette.ItemView.extend({
  el: '#main',

  template: 'bourbonView',

  events: {
    'click': 'rateBourbon'
  },

  initialize: function () {
    this.render();
  },

  rateBourbon: function () {
    console.log('This will be a rating');

    event.preventDefault();
    $('<div>' + 'Rating' + '</div>').appendTo('#content');
    // BrbnApp.router.navigate('bourbons/' + $(event.target).data('bourbon-id'), true);
  }
});
