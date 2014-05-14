BrbnApp.Views.BourbonView = BrbnApp.Views.BourbonView || {};

BrbnApp.Views.BourbonView = Backbone.Marionette.ItemView.extend({
  template: 'bourbonView',

  events: {
    'click': 'rateBourbon'
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