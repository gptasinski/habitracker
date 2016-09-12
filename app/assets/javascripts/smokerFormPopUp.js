$(document).ready(function () {

  function smokerFormPopUp (parent, target, space) {
    $(parent).on("click", target, function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        var form = $(response).find("#smkr-form");
        $(form).removeClass("col-md-offset-1 col-md-4");
        $(form).addClass("row");
        $(space).html(form);
      });
    });
  }

  smokerFormPopUp(".add-btn", "#smkr-add", "#smkr-space");

});


