$(document).ready(function () {

  function helloFormsPopUp (parent, target) {
    $(parent).on("click", target, function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        $("#home-space").html(response);
      });
    });
  }

  helloFormsPopUp(".navbar", "#login-btn");
  helloFormsPopUp(".navbar", "#sign-up-btn");

});


