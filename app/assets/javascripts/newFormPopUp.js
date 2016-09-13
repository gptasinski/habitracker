$(document).ready(function () {

  function newFormPopUp (parent, target, space) {
    $(parent).on("click", target, function (event) {
      event.preventDefault();
      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      function smokerForm (response) {
        var form = $(response).find("#smkr-form");
        $(form).removeClass("col-md-offset-1 col-md-4");
        $(form).addClass("row");
        if($('#d-btn').length === 1) {
          $("#d-btn").hide();
        }
        $(space).html(form);
      }

      function swimForm (response) {
        var form = $(response).find("#swim-form");
        $(form).removeClass("col-md-10");
        $(form).addClass("row");
        $(form).addClass("pre-scrollable");

        $("#swim-main").html(form);
        $("#swim-main").css("border-bottom", "1px solid black");
      }

      request.done(function (response) {
          smokerForm(response);
          swimForm(response);
      });
    });
  }

  newFormPopUp(".add-btn", "#smkr-add", "#smkr-space");
  newFormPopUp(".add-btn", "#swim-add", "#swim-space");
});


