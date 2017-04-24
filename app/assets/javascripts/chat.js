//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  console.log("Onload 2");
  load_chat_list();
});

function load_chat_list() {
  $("#chat_list").html("<i>Loading</i>");
  $.ajax("/user/index")
    .done(function (list) {
      $("#chat_list").html(list);
    });
}

function load_conversation_with(id, that) {
  $(".user-list").removeClass("active");
  $(that).addClass("active");
  load_conversation(id);
}

function load_conversation(id) {
  $("#conversation").html("<i>Loading</i>");
  $.ajax("/chat/load_conversation/"+id)
    .done(function (conversation) {
      $("#conversation").html(conversation);
      $("#conversation ul").scrollTop($("#conversation ul li:last-child").offset().top);
    });
}

function send_message(id) {
  $.post("/chat/send_message/"+id,
         {"message": $("#message")[0].value},
         function(data) {
           load_conversation(id);
         }
        );
}
