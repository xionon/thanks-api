//= require actions/message_actions

var fetchNewMessages = function() {
  $.getJSON("/messages.json").done(function(json) {
    MessageActions.refreshAll(json.messages);
    watchForNewMessages();
  });
}

var watchForNewMessages = function() {
  setTimeout(fetchNewMessages, 500);
}

watchForNewMessages();
