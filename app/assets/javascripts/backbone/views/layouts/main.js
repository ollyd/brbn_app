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
    
    if (BrbnApp.currentUser) {
      $('#logincontrols').html('<a href="/users/sign_out" data-method="delete">Sign out</a>');
    } else {
      $('#logincontrols').html('<a href="/users/sign_in">Sign in</a>');
    }
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

    //If the matches array has matching bourbons inside, display these bourbons, otherwise, display the error message.
    if (matches.length > 0) {
    $.each(matches, function(index, brbn){
      $('<div class="bourbonlist">' + 'Exact Match:' + '</div>').appendTo('#bourbons')
      $('<li>' + brbn.attributes.name + '</li>').data('bourbon-id', brbn.attributes.id).appendTo('#bourbons');
      
      $('<div class="bourbonlist">' + '3 Most Similar:' + '</div>').appendTo('#bourbons');
      var similarBourbons = brbn.get('similarity');
      for (var i = 0; i < similarBourbons.length; i++) {
        var similar = BrbnApp.brbns.get(similarBourbons[i][1]);
        var similarity = similarBourbons[i][0];
        $('<li>' + similar.get('name') + ' ' + '☞ ' + Math.round(similarity) + '% ' + 'similar' + '</li>').data('bourbon-id', similar.attributes.id).appendTo('#bourbons');
      }
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