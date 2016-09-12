$(document).ready(function () {

  function smokerEditPopUp (target, space) {
    $(target).on("click", function (event) {
      event.preventDefault();

      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      request.done(function (response) {
        var form = $(response).find("#smkr-edit");
        var deleteButton = $(response).find("#d-btn");

        $(form).removeClass("col-md-offset-1 col-md-4");
        $(form).addClass("row");
        $(space).html(form);

        $(deleteButton).removeClass("row");
        $("#link-row").append(deleteButton);
      });
    });
  }

  smokerEditPopUp(".stat-link", "#smkr-space" );

});


