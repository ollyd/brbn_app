BrbnApp.Views.percentageView = Backbone.Marionette.ItemView.extend({
    tagName: 'div', 
    // el: 'percentage-container',

    template: 'percentageView',

    initialize: function () {
    this.render();
    this.bourbons = new BrbnApp.Collections.Bourbons();

    // Need to create a function which iterates through every attribute and compares the values to every other bourbon.
    // Then divides the values by one another and * 100 to give percentage diff. 100 - diff with give % similarity
    // eg (brbn a, brbn b)
    // brbn a = woody: 7
    // brbn b = woody: 5
    // a - b / a = 0.28571429
    // 0.28571429 * 100 = 28.57
    // 100 - 28.57 = 71.43 % similar
    // do this for all attributes, then take the average similarity, and sort in ascending value

    // var self = this;
    // this.bourbons.fetch({
    //     success: function () {
    //         self.bourbons.each(function (bourbon) {
    //             console.log('bourbon', bourbon.attributes);
    //             $('<li>' + bourbon.attributes + '</li>').appendTo('#main');//.data('bourbon-id', bourbon.attributes.id).appendTo('#main');
    //         })
    //     }
    // });

        var $container = $('#percentage-container'),
            τ = 2 * Math.PI,
            width = $container.width(),
            height = $container.height(),
            outerRadius = Math.min(width,height)/2,
            innerRadius = (outerRadius/5)*4,
            fontSize = (Math.min(width,height)/4);
 
        var arc = d3.svg.arc()
            .innerRadius(innerRadius)
            .outerRadius(outerRadius)
            .startAngle(0);

        var svg = d3.select('#percentage-container').append("svg")
            .attr("width", '100%')
            .attr("height", '200px')
            .attr('viewBox','0 0 '+Math.min(width,height) +' '+Math.min(width,height) )
            .attr('preserveAspectRatio','xMinYMin')
            .append("g")
            .attr("transform", "translate(" + Math.min(width,height) / 2 + "," + Math.min(width,height) / 2 + ")");

        var text = svg.append("text")
            .text('0%')
            .attr("text-anchor", "middle")
            .style("font-size",fontSize+'px')
            .attr("dy",fontSize/3)
            .attr("dx",2);
        
        var background = svg.append("path")
            .datum({endAngle: τ})
            .style("fill", "#ff8b80")
            .attr("d", arc);

        var foreground = svg.append("path")
            .datum({endAngle: 0 * τ})
            .style("fill", "#98dd7c")
            .attr("d", arc);

        setInterval(function() {
          foreground.transition()
               // .duration(750) 
               .call(arcTween, 0.3 * τ);
        }, 1500); 

        function arcTween(transition, newAngle) {

            transition.attrTween("d", function(d) {
        
                var interpolate = d3.interpolate(d.endAngle, newAngle);
                
                return function(t) {
                    
                    d.endAngle = interpolate(t);
                    
                    text.text(Math.round((d.endAngle/τ)*100)+'%');
                    // text.text('Match');
                    
                    return arc(d);
                };
            });
        }
    }
});