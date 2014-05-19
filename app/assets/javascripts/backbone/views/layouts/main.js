BrbnApp.Views.Layouts.Main = Backbone.Marionette.Layout.extend({
  template: 'layouts/main',
  regions: {
    content: '#content'
  },

  events: {
    'click li': 'viewBourbon',
    'submit': 'search'
  },

  initialize: function() {
    $('#bourbons').hide();
    this.model = new BrbnApp.Models.Bourbon();
    this.modelBinder = new Backbone.ModelBinder();
    this.bourbons = new BrbnApp.Collections.Bourbons();

   // Replace this with Marionette CollectionView 
    var self = this;
    this.bourbons.fetch({
        success: function () {
            self.bourbons.each(function (b) {
                $('<li>' + b.attributes.name + '</li>').data('bourbon-id', b.attributes.id);
            })
        }
    });

    // Autocomplete Search functionality
    var bourbonList = new AutoCompleteList(); 
    bourbonList.fetch({async: false});
    var bourbonNames = bourbonList.pluck("name");

    $("#search").autocomplete({ 
      source : bourbonNames,
      minLength : 2,
      select: function(event, ui){ 
        var selectedModel = bourbonList.where({name: ui.item.value})[0];
        var view = new SelectionView({model: selectedModel});
        view.render();
      }
    });
    
  },

  search: function(event) { 
    event.preventDefault();
    var bourbonSearch = $('#search').val();
    $('#bourbons').empty();
    var matches = [];
    var error;

    // If statement to check the inputs.
    if (bourbonSearch != ''){
      error = 'Sorry no match. Please try again.';
      //Go through all bourbons and check if matches search
      this.bourbons.each(function(brbn){
        if(bourbonSearch == brbn.attributes.name){
          //push the model in the matches array if there is a match.
          matches.push(brbn);
      } 
    });

    //If search is empty
    } else {
      $('#bourbons').append("Your search is empty, please try again")
    }

debugger;
    var self = this;
    var similar = self.model.get(self.bourbons.attributes.name);

    //If the matches array has matching bourbons inside, display these bourbons, otherwise, display the error message.
    if (matches.length > 0) {
    $.each(matches, function(index, brbn){
      $('<li>' + 'Your Choice:' + '</li>').appendTo('#bourbons')
      $('<li>' + brbn.attributes.name + '</li>').data('bourbon-id', brbn.attributes.id).appendTo('#bourbons');
      $('<li>' + 'Similar Bourbons:' + '</li>').appendTo('#bourbons')
      // $('<li>' + brbn.attributes.all_similar.name + '</li>').data('bourbon-id', brbn.attributes.id).appendTo('#bourbons');
    });
  
    } else {
      $('#bourbons').append(error);
    }
      $('#bourbons').fadeIn(1000);   
     
  },

  onRender: function() {
    this.modelBinder.bind(this.model, this.el);
  },

  viewBourbon: function (event) {
    event.preventDefault();
    BrbnApp.router.navigate('bourbons/' + $(event.target).data('bourbon-id'), true);
  }

});

BrbnApp.addInitializer(function() {
  BrbnApp.layouts.main = new BrbnApp.Views.Layouts.Main();
});