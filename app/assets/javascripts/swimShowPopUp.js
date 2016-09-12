$(document).ready(function () {

  function swimShowPopUp (target, space) {
    $(target).on("click", function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        var show = $(response).find("#swim-show");
        var buttons = $(response).find("#swim-edit");
;
        $(buttons).removeClass("row");
        $(show).removeClass("col-md-10");

        $("#swim-add").hide();
        $("#link-row").append(buttons);
        $("#swim-main").html(show);
      });
    });
  }

  swimShowPopUp(".swim-link", "#swim-main");

});


