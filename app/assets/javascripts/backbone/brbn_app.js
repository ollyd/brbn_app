//= require_self
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers

// Use Handlebars/Moustache style templates to prevent conflict with ERB.
_.templateSettings = {
  interpolate: /\{\{(.+?)\}\}/g
};

window.BrbnApp = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
}

// Instantiate router once data has been fetched, then listen for URL changes
$(document).ready(function () {
    BrbnApp.brbns = new BrbnApp.Collections.Bourbons();
    BrbnApp.brbns.fetch().done(function () {
        BrbnApp.router = new BrbnApp.Routers.appRouter();
        Backbone.history.start({pushState: false});
    });
});