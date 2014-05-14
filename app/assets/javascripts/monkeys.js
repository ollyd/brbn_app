Backbone.Marionette.Renderer.render = function(template, data) {
  return HandlebarsTemplates['backbone/templates/' + template](data);
};