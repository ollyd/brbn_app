var SelectionView = Backbone.View.extend({ 
      el : $('#user-selection'),
      render: function() {
        $(this.el).html("You Selected : " + this.model.get('name'));
        return this;
      },
});