var app = window.app = {}
app.Restaurants = function() {
  this._input = $("#restaurants-search-txt");
  this._initAutocomplete();
};

app.Restaurants.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: "/restaurants/search",
        appendTo: "#restaurants-search-results",
        select: $.proxy(this._select, this)
      })
      .autocomplete("instance")._renderItem = $.proxy(this._render, this);
  },

   _render: function(ul, item) {
    var markup = [
      '<span class="img">',
        '<img src="' + item.image + '" />',
      '</span>',
      '<span class="name">' + item.name + '</span>',
      '<span class="location">' + item.location + '</span>'
      // '<span class="price">' + item.price + ' ' + item.published_at + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.name + " - " + ui.item.location);
    return false;
  }
};
