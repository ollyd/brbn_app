BrbnApp.Views.ratingView = Backbone.Marionette.ItemView.extend({
  el: '#main',

  template: 'ratingView',

  events: {
    'click': 'stars'
  },

  initialize: function () {
    this.render();
  }
});