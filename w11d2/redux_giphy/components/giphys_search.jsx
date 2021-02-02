import React, { Component } from 'react'
import GiphysIndex from './giphys_index';

export class GiphysSearch extends Component {
  constructor(props) {
    debugger
    super(props);
    this.state = { searchTerm: '' }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({ searchTerm: e.target.value })
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    return (
      <div>
        <form>
          <input value={this.state.searchTerm} onChange={this.handleChange} />
          <button type="submit" onClick={this.handleSubmit}>Search Giphy</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    )
  }
}

export default GiphysSearch
