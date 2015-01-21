var MessageList = React.createClass({
  propTypes: {
    messages: React.PropTypes.array
  },

  componentDidMount: function() {
    MessageStore.addChangeListener(function() {
      this.setState({ messages: MessageStore.getAll() });
    }.bind(this));
  },

  getInitialState: function() {
    return { messages: this.props.messages };
  },

  render: function() {
    var messages = this.state.messages.map(function(message) {
      return <Message key={"message-" + message.id} message={message} />;
    });

    return (
      <div>{messages}</div>
    );
  }
});
