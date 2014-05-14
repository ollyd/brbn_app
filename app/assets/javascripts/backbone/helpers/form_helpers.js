BrbnApp.Helpers.FormHelpers = {};

BrbnApp.Helpers.FormHelpers.fieldHelp = function(message) {
  return HandlebarsTemplates['backbone/templates/shared/form_field_help']({
    'message': message
  });
};