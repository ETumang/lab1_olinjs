var $form = $("#editPageInput");

var onSuccess = function(data, status) {
  var id = data._id;
  console.log("Data is : "+data)
   $.get("displayEdited/"+data._id)
    .done(function(data,status){
      console.log(data)
      $("#content").html(data);
    })
    .error(onError);
};

var onError = function(data, status) {
  console.log("status", status);
  console.log("error", data);
};

$form.submit(function(event) {
  event.preventDefault();

    var title = $form.find("#pageTitle").val();
    var content = $form.find("#pageContent").val();
    var pageID = $form.find("#pageTitle").attr("name");

  $.post("editPageSubmit", {
    newPageTitle: title,
    newPageContent: content,
    newPageID: pageID
  }).done(onSuccess).error(onError)

});