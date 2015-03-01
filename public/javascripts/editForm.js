var $form = $("#editPageInput");

var onSuccess = function(data, status) {
  var id = $this.data()
  alert(id);
   $.post("displayEdited", {id:id})
    .done(function(data,status){
      console.log("Load edited content")
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

    alert("title: " + title+ "     content: "+content + "     pageID: "+pageID);

  $.post("editPageSubmit", {
    newPageTitle: title,
    newPageContent: content,
    newPageID: pageID
  })
    .done(onSuccess)
    .error(onError);
});