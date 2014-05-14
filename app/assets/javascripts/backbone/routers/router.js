BrbnApp.Routers.appRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'bourbons/:id': 'showBourbon',
    '*anything': 'goHome'
  },

  index: function () {
    var view = new BrbnApp.Views.Layouts.Unauthenticated;
    view.render();
  },

  showBourbon: function (id) {
    var bourbon = BrbnApp.brbns.get(id);
    new BrbnApp.Views.BourbonView({model:bourbon});
  },

  goHome: function () {
    document.location.hash = '';
  }
});