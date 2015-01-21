//= require ../dispatcher/app_dispatcher
//= require ../constants/message_constants

var MessageActions = {
  refreshAll: function(messages) {
    AppDispatcher.dispatch({
      actionType: MessageConstants.MESSAGE_REFRESH_ALL,
      messages: messages
    });
  }
}
