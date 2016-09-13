$(document).ready(function () {

  function editShowPopUp (target, space) {
    $(target).on("click", function (event) {
      event.preventDefault();
      var url = $(this).attr("href");

      var request = $.ajax({
        url: url
      });

      function smokerForm (response) {
        var form = $(response).find("#smkr-edit");
        var deleteButton = $(response).find("#d-btn");
        $(form).removeClass("col-md-offset-1 col-md-4");
        $(form).addClass("row");
        $(space).html(form);
        $(deleteButton).removeClass("row");
        if($("#d-btn").length === 0) {
          $("#smkr-add").hide();
          $("#link-row").append(deleteButton);
        }
      }

      function swimForm (response) {
        var show = $(response).find("#swim-show");
        var buttons = $(response).find("#swim-edit");
        $(buttons).removeClass("row");
        $(show).removeClass("col-md-10");
        $("#swim-add").hide();
        $("#link-row").append(buttons);
        $("#swim-main").html(show);
      }

      request.done(function (response) {
        smokerForm(response);
        swimForm(response);
      });

    });
  }

  editShowPopUp(".stat-link", "#smkr-space" );
  editShowPopUp(".swim-link", "#swim-main");

});


