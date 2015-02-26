var $form = $("#editPageInput");

var onSuccess = function(data, status) {
  alert("Edit page has been submitted yayyyyyy");
};

var onError = function(data, status) {
  console.log("status", status);
  console.log("error", data);
};

$form.submit(function(event) {
  event.preventDefault();
  var title = $form.find("#pageTitle").val();
  var content = $form.find("#pageContent").val();
  var pageID = $form.find("#submit".attr("name"));
  $.get("editPageSubmit", {
    title: title,
    content: content,
    pageID: pageID
  })
    .done(onSuccess)
    .error(onError);
});