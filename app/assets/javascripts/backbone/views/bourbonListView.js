BrbnApp.Views.BourbonListView = BrbnApp.Views.BourbonListView || {};

BrbnApp.Views.BourbonListView = Backbone.Marionette.ItemView.extend({
  template: 'bourbonListView',

  events: {
    'click': 'viewBourbon'
  },

  initialize: function() {
    this.model = new BrbnApp.Models.Bourbon();
    // this.modelBinder = new Backbone.ModelBinder();
  },

  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },
  // onRender: function() {
  //   this.modelBinder.bind(this.model, this.el);
  // },

  viewBourbon: function (event) {
    event.preventDefault();
    BrbnApp.router.navigate('bourbons/' + this.model.get('id'), true);
  }

});