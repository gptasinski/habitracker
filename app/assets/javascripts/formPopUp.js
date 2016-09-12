$(document).ready(function () {

  function formPopUp (parent, target, space) {
    $(parent).on("click", target, function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        var form = $(response)
        $(space).html(response);
      });
    });
  }

  formPopUp(".navbar", "#login-btn", "#home-space");
  formPopUp(".navbar", "#sign-up-btn", "#home-space");

});


