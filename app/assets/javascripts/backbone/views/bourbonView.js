BrbnApp.Views.BourbonView = Backbone.Marionette.ItemView.extend({
  el: '#main',

  template: 'bourbonView',

  events: {
    'click': 'rateBourbon'
  },

  initialize: function () {

  this.listenTo(this, 'render', this.afterRender);
  this.render();

  // Work out the average user ratings for the borubon being shown 
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

  //////////////////////////////////////
  //////// BOURBON WHEEL CHART ////////
  ////////////////////////////////////

  // Add Radar Chart to chart div  
    d3.select("#chart").append("svg"); 

    var w = 500,
        h = 500;

    var colorscale = d3.scale.category10();

    //Legend titles
    var LegendOptions = [this.model.attributes.name,'Bourbon B'];

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
          {axis:"toffee",value:0.48},
          {axis:"woody",value:0.91},
          {axis:"tannic",value:0.27},
          {axis:"char",value:0.28},
          {axis:"sweet",value:0.46},
          {axis:"grainy",value:0.29},
          {axis:"vanilla",value:0.81},
          {axis:"corny",value:0.34},
          {axis:"buttery",value:0.65},
          {axis:"heat",value:0.19},
          {axis:"dark_fruit",value:0.14},
          {axis:"citrus_fruit",value:0.06},
          {axis:"floral",value:0.24},
          {axis:"spicy",value:0.67},
          {axis:"herbal",value:0.25},
          {axis:"malty",value:0.42},
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
    var text = svg.append("text")
      .attr("class", "title")
      .attr('transform', 'translate(90,0)') 
      .attr("x", w - 70)
      .attr("y", 10)
      .attr("font-size", "12px")
      .attr("fill", "#404040")
      .text("Bourbon flavour wheel");
        
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
      // this.$el.append(
      $('#user-rating').raty({
        score: function() {
          return $(this).attr('data-score');
        },
        path: 'assets/',
        width: 200
      });
      // console.log(data-score);
    },

    afterRender: function() {
      // debugger;
      console.log('in afterRender');
      var view = new BrbnApp.Views.percentageView();
      $('#percentage-container').append(view.render().el); 
    }
    

});
