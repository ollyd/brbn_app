BrbnApp.Views.Layouts.Main = Backbone.Marionette.Layout.extend({
  template: 'layouts/main',
  regions: {
    content: '#content'
  },

  events: {
    'click li': 'viewBourbon'
    // 'submit form': 'search'
  },

  initialize: function() {
    this.model = new BrbnApp.Models.Bourbon();
    this.modelBinder = new Backbone.ModelBinder();
    this.bourbons = new BrbnApp.Collections.Bourbons();

    // Replace this with Marionette CollectionView 
    var self = this;
    this.bourbons.fetch({
        success: function () {
            self.bourbons.each(function (b) {
                $('<li>' + b.attributes.name + '</li>').data('bourbon-id', b.attributes.id).appendTo('#bourbons');
            })
        }
    });
  },

  onRender: function() {
    this.modelBinder.bind(this.model, this.el);
  },

  viewBourbon: function (event) {
    event.preventDefault();
    BrbnApp.router.navigate('bourbons/' + $(event.target).data('bourbon-id'), true);
  }

});

BrbnApp.addInitializer(function() {
  BrbnApp.layouts.main = new BrbnApp.Views.Layouts.Main();
});