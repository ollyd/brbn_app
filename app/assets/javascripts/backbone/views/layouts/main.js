BrbnApp.Views.Layouts.Main = Backbone.Marionette.Layout.extend({
  template: 'layouts/main',
  regions: {
    content: '#content'
  }
});

BrbnApp.addInitializer(function() {
  BrbnApp.layouts.main = new BrbnApp.Views.Layouts.Main();
});