BrbnApp.Views.Layouts.Unauthenticated = Backbone.Marionette.Layout.extend({
  template: 'layouts/unauthenticated',
  regions: {
    tabContent: '#tab-content'
  },

  views: {},

  events: {
    'click ul.nav-tabs li a': 'switchViews'
  },

  onShow: function() {
    this.views.login = BrbnApp.Views.Unauthenticated.Login;
    this.views.signup = BrbnApp.Views.Unauthenticated.Signup;
    this.views.retrievePassword = BrbnApp.Views.Unauthenticated.RetrievePassword;
    this.tabContent.show(new this.views.login);
  },

  switchViews: function(e) {
    e.preventDefault();
    this.tabContent.show(new this.views[$(e.target).data('content')]);
  }

});

BrbnApp.addInitializer(function() {
  BrbnApp.layouts.unauthenticated = new BrbnApp.Views.Layouts.Unauthenticated();
});