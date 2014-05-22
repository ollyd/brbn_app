BrbnApp.Views.BourbonView = Backbone.Marionette.ItemView.extend({
  el: '#main',

  template: 'bourbonView',

  events: {
    'click a': 'viewBourbon',
    'click button.btn.btn-success': 'rateBourbon',
    'click #user-rating': 'savedScore'
  },

  initialize: function () {

  this.listenTo(this, 'render', this.afterRender);
  this.render();

  // Work out the average user ratings for the bourbon being shown 
  var starTotal = 0;
  for (var i = 0; i < this.model.attributes.ratings.length; i++) {
      starTotal += this.model.attributes.ratings[i].score;
  }   
  var starAvg = starTotal / this.model.attributes.ratings.length;
     
   
  // Display bourbon star rating 
    $('#star').raty({
      path: 'assets/',
      readOnly: true, score: starAvg,
      width: 200
    });

    $('#user-rating').hide();   


  //////////////////////////////////////
  //////// BOURBON WHEEL CHART ////////
  ////////////////////////////////////

  // Add Radar Chart to chart div  
    d3.select("#chart").append("svg"); 

    var w = 500,
        h = 500;

    var colorscale = d3.scale.category10();

    var similar = BrbnApp.brbns.get(this.model.attributes.similar_id);
    var similarName = similar.attributes.name
    //Legend titles    
    var LegendOptions = [this.model.attributes.name, similarName];
    //Data
    var d = [
          [
          {axis:"toffee",value: this.model.attributes.toffee / 10 },
          {axis:"woody",value: this.model.attributes.woody / 10},
          {axis:"tannic",value: this.model.attributes.tannic / 10},
          {axis:"char",value: this.model.attributes.toffee / 10},
          {axis:"sweet",value: this.model.attributes.sweet / 10},
          {axis:"grainy",value: this.model.attributes.grainy / 10},
          {axis:"vanilla",value: this.model.attributes.vanilla / 10},
          {axis:"corny",value: this.model.attributes.corny / 10},
          {axis:"buttery",value: this.model.attributes.buttery / 10},
          {axis:"heat",value: this.model.attributes.heat / 10},
          {axis:"dark fruit",value: this.model.attributes.dark_fruit / 10},
          {axis:"citrus fruit",value: this.model.attributes.citrus_fruit / 10},
          {axis:"floral",value: this.model.attributes.floral / 10},
          {axis:"spicy",value: this.model.attributes.spicy / 10},
          {axis:"herbal",value: this.model.attributes.herbal / 10},
          {axis:"malty",value: this.model.attributes.malty / 10},
          ],[
          {axis:"toffee",value: similar.attributes.toffee / 10 },
          {axis:"woody",value: similar.attributes.woody / 10},
          {axis:"tannic",value: similar.attributes.tannic / 10},
          {axis:"char",value: similar.attributes.toffee / 10},
          {axis:"sweet",value: similar.attributes.sweet / 10},
          {axis:"grainy",value: similar.attributes.grainy / 10},
          {axis:"vanilla",value: similar.attributes.vanilla / 10},
          {axis:"corny",value: similar.attributes.corny / 10},
          {axis:"buttery",value: similar.attributes.buttery / 10},
          {axis:"heat",value: similar.attributes.heat / 10},
          {axis:"dark fruit",value: similar.attributes.dark_fruit / 10},
          {axis:"citrus fruit",value: similar.attributes.citrus_fruit / 10},
          {axis:"floral",value: similar.attributes.floral / 10},
          {axis:"spicy",value: similar.attributes.spicy / 10},
          {axis:"herbal",value: similar.attributes.herbal / 10},
          {axis:"malty",value: similar.attributes.malty / 10},
          ]
        ];

    //Options for the Radar chart, other than default
    var mycfg = {
      w: w,
      h: h,
      maxValue: 1,
      levels: 10,
      ExtraWidthX: 300
    }

    //Call function to draw the Radar chart
    //Will expect that data is in %'s
    RadarChart.draw("#chart", d, mycfg);

    /////////// Initiate legend ////////////////

    var svg = d3.select('#chart')
      .selectAll('svg')
      .append('svg')
      .attr("width", w+300)
      .attr("height", h)

    //Create the title for the legend
    // var text = svg.append("text")
    //   .attr("class", "title")
    //   .attr('transform', 'translate(90,0)') 
    //   .attr("x", w - 70)
    //   .attr("y", 10)
    //   .attr("font-size", "12px")
    //   .attr("fill", "#404040")
    //   .text("Bourbon flavour wheel");
        
    //Initiate Legend 
    var legend = svg.append("g")
      .attr("class", "legend")
      .attr("height", 100)
      .attr("width", 200)
      .attr('transform', 'translate(90,20)') 
      ;
      //Create colour squares
      legend.selectAll('rect')
        .data(LegendOptions)
        .enter()
        .append("rect")
        .attr("x", w - 65)
        .attr("y", function(d, i){ return i * 20;})
        .attr("width", 10)
        .attr("height", 10)
        .style("fill", function(d, i){ return colorscale(i);})
        ;
      //Create text next to squares
      legend.selectAll('text')
        .data(LegendOptions)
        .enter()
        .append("text")
        .attr("x", w - 52)
        .attr("y", function(d, i){ return i * 20 + 9;})
        .attr("font-size", "11px")
        .attr("fill", "#737373")
        .text(function(d) { return d; })
        ; 

    },

    rateBourbon: function () {
      event.preventDefault();
      
      $('button.btn.btn-success').slideUp('slow');  
      $('#user-rating').fadeIn(1500);  
      $('#user-rating').raty({
        score: function() {
          return $(this).attr('data-score');
        },
        path: 'assets/',
        width: 260
      });
    },

    savedScore: function () {
      event.preventDefault();
      score = new BrbnApp.Models.Rating({
        score: $('#user-rating').raty('score')
      });
      score.save();
      $('#user-rating').fadeOut(1500);
    },

    viewBourbon: function (event) {
      var id = $(event.target).data('bourbon-id');
      if (id) {
        BrbnApp.router.navigate('bourbons/' + id, true);
        return false;
      }
    },

    afterRender: function() {
      var view = new BrbnApp.Views.percentageView({model:this.model});
      $('#percentage-container').append(view.render().el); 
    }
    

});
