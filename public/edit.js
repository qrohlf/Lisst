$(document).ready(function() {
  // Make the details editable
  $(".editable .detail").attr("contenteditable", "true");
  $(".editable .detail").keyup(function(event) {
        var div = $(this).parent();
        window.clearTimeout(div.data('timer'));
        var timer = setTimeout(function() {updateItem(div);}, 500);
        div.data('timer', timer);
    });

  var updateItem = function(div) {
    var id = div.attr("data-id");
    var title = $(".title", div).text();
    var content = $(".content", div).text();
    var trash = $(".trash", div);
    var spinner = $(".spinner", div);
    var data = {_method:"put", title: title, content: content};
    trash.fadeOut();
    spinner.fadeIn();
    $.post("/"+id, data, function(response) {
        spinner.fadeOut();
        trash.fadeIn();
    });
  }

});