BrbnApp.Models.Bourbon = Backbone.Model.extend({
    url: '/bourbons',
    initialize: function (r) {
        if (! r) return;
        console.log('b', r.similar);
        this.similar = new BrbnApp.Models.Bourbon(r.similar);
    }
});