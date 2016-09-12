$(document).ready(function () {

  function smokerFormPopUp (parent, target, space) {
    $(parent).on("click", target, function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        var form = $(response).find("#swim-form");
        $(form).removeClass("col-md-10");
        $(form).addClass("row");
        $(form).addClass("pre-scrollable");

        $("#swim-main").html(form);
        $("#swim-main").css("border-bottom", "1px solid black");
      });
    });
  }

  smokerFormPopUp(".add-btn", "#swim-add", "#swim-space");
});


