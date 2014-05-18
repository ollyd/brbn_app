var AutoCompleteList = Backbone.Collection.extend({ 
      model: AutoComplete,
      url: '/bourbons.json',
      parse: function(response) {
        return response;
      }
    });
