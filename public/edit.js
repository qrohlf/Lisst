$(document).ready(function() {
  // Make the details editable
  $(".editable .detail").attr("contenteditable", "true");
  $(".editable .detail").keyup(function(event) {
        console.log('keyup');
        var div = this;
        window.clearTimeout($(this).data('timer'));
        var timer = setTimeout(function() {updateItem(div);}, 1000);
        $(this).data('timer', timer);
    });

  var updateItem = function(div) {
    var div = $(div);
    var id = div.parent().attr("data-id");
    var title = $(".title", div.parent()).text();
    var content = $(".content", div.parent()).text();
    var trash = $(".trash", div.parent());
    var spinner = $(".spinner", div.parent());
    var data = {_method:"put", title: title, content: content};
    trash.fadeOut();
    spinner.fadeIn();
    $.post("/"+id, data, function(response) {
        spinner.fadeOut();
        trash.fadeIn();
    });
  }

});