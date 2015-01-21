var Message = React.createClass({
  propTypes: {
    message: React.PropTypes.shape({
      id: React.PropTypes.number,
      recipient: React.PropTypes.string,
      body: React.PropTypes.string
    })
  },

  render: function() {
    return (
      <dl>
        <dt>To</dt>
        <dd>{this.props.message.recipient}</dd>

        <dt>Body</dt>
        <dd>{this.props.message.body}</dd>
      </dl>
    );
  }
});
