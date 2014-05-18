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
    this.model = new BrbnApp.Models.Bourbon();
    this.modelBinder = new Backbone.ModelBinder();
    this.bourbons = new BrbnApp.Collections.Bourbons();

    // Replace this with Marionette CollectionView 
    var self = this;
    this.bourbons.fetch({
        success: function () {
            self.bourbons.each(function (b) {
                $('<li>' + b.attributes.name + '</li>').data('bourbon-id', b.attributes.id).appendTo('#bourbons');
            })
        }
    });
  },

  search: function(event) {

    // var self = this,
        // el = $(this.el);

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
        $('<li>' + brbn.attributes.name + '</li>').data('bourbon-id', brbn.attributes.id).appendTo('#bourbons');
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