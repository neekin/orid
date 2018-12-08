// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
// var source = new EventSource('/messages/events')
// source.addEventListener('messages.create',function(e){
//     // console.log(e);
//     var message = $.parseJSON(e.data)
//     console.log(message);
//     $('#chat').append($('<li>').text(`${message.nickname}: ${message.content}`))
// })