BrbnApp.Views.Unauthenticated = BrbnApp.Views.Unauthenticated || {};

BrbnApp.Views.Unauthenticated.Search = Backbone.Marionette.ItemView.extend({
  template: 'unauthenticated/search',

  events: {
    'submit form': 'search'
  },

  initialize: function() {
    this.model = new BrbnApp.Models.UserSession();
    this.modelBinder = new Backbone.ModelBinder();
  },

  onRender: function() {
    this.modelBinder.bind(this.model, this.el);
  },

  search: function(event) {

    var self = this,
        el = $(this.el);

    event.preventDefault();
    var bourbonSearch = $('#search').val();
    $('#bourbons').empty();
    var matches = [];
    var error;

    //When the user makes a search, display the title "Exact Match"
    $('.exact_match').show();   
    //If statement to check the inputs.
      //If there is no match say so.
      if (bourbonSearch != ''){
        error = 'Sorry no match. Please see similar below.';
        //Go through all bourbons and check if matches search
        $.each(this.collection.models, function(index, model){
          if(bourbonSearch == model.attributes.name){
            //push the model in the matches array if there is a match.
            matches.push(model);
        } 
      });

      //If search is empty
      } else {
        $('#bourbons').append("Your search is empty, please try again")
      }
  
      //If the matches array has matching bourbons inside, display these bourbons, otherwise, display the error message.
      if (matches.length > 0) {
      $.each(matches, function(index, model){
        var view = new BrbnApp.Views.BourbonListView({model:model});
        $('#bourbons').append(view.render().el);
      });
    
    } else {
      $('#bourbons').append(error);
    }
  },

  // render: function () {
  //   this.$el.html(this.template());
  //   console.log("I am in AppView");

  //   this.collection.each(function (flight) {

  //   var view = new BurningAirline.Views.FlightListView({model:flight});
  //   //Hide the flights at first. Should be displayed only when the user makes a search
  //   //$('#flights').append(view.render().el);
  //   });
  // }

  // }

});