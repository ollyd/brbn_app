BrbnApp.Helpers.Notifications = {};

BrbnApp.Helpers.Notifications.alert = function(alertType, message) {
  return HandlebarsTemplates['backbone/templates/shared/notifications']({
    'alertType': alertType,
    'message': message
  });
};

BrbnApp.Helpers.Notifications.error = function(message) {
  return this.alert('error', message);
};

BrbnApp.Helpers.Notifications.success = function(message) {
  return this.alert('success', message);
};

Handlebars.registerHelper('notify_error', function(msg) {
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(BrbnApp.Helpers.Notifications.error(msg));
});

Handlebars.registerHelper('notify_success', function(msg) {
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(BrbnApp.Helpers.Notifications.success(msg));
});