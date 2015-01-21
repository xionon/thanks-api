//= require mdn_polyfills
//= require EventEmitter
//= require dispatcher/app_dispatcher
//= require ../constants/message_constants

var MessageStore = (function() {
  var _messages = {};

  var messageStore = Object.assign({}, EventEmitter.prototype, {
    getAll: function() {
      return _messages;
    },

    emitChange: function() {
      this.trigger('change')
    },

    addChangeListener: function(callback) {
      this.on('change', callback);
    },

    dispatcherIndex: AppDispatcher.register(function(payload) {
      var actionType = payload.actionType;
      var recipient, body;

      switch(actionType) {
        case MessageConstants.MESSAGE_REFRESH_ALL:
          _messages = payload.messages;
          messageStore.emitChange();
          break;
      }
      return true;
    })
  });

  return messageStore;
})()
