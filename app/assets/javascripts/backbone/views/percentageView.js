BrbnApp.Views.percentageView = Backbone.Marionette.ItemView.extend({
    tagName: 'div', 
    // el: 'percentage-container',

    template: 'percentageView',
    events: {
        'click a': 'viewBourbon'
    }, 

    initialize: function () {
    this.render();

    var similar = BrbnApp.brbns.get(this.model.attributes.similar_id);
    var similarName = similar.attributes.name
    this.model.set('similarName', similarName);
    this.model.set('similarID', similar.get('id'));

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

        var view = this;
        setInterval(function() {
        foreground.transition()
               .duration(1500) 
               .call(arcTween, (view.model.attributes.similarity / 100) * τ);
        }, 1000); 

        function arcTween(transition, newAngle) {
            transition.attrTween("d", function(d) {
                var interpolate = d3.interpolate(d.endAngle, newAngle);
                return function(t) {
                    d.endAngle = interpolate(t);
                    text.text(Math.round((d.endAngle/τ)*100)+'%');
                    return arc(d);
                };
            });
        }
        // $('#percentage-container').append('<div id="similar-name">' + similarName + '</div>');
    },

    // viewBourbon: function (){ 
    //     BrbnApp.router.navigate('bourbons/' + $(event.target).data('bourbon-id'), true);
    // } 
});