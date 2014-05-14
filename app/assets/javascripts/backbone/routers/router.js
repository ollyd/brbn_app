BrbnApp.Routers.appRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'bourbons/:id': 'showBourbon',
    '*anything': 'goHome'
  },

  index: function () {
    console.log('I am in router.js')
    var view = new BrbnApp.Views.AppView({collection: BrbnApp.brbns});
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