var Record = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    date: React.PropTypes.node,
    amount: React.PropTypes.node
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Date: {this.props.date}</div>
        <div>Amount: {this.props.amount}</div>
      </div>
    );
  }
});
