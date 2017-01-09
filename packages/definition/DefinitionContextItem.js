import { Component } from 'substance'

class DefinitionContextItem extends Component {

  render($$) {
    let el = $$('div')
      .attr("data-id", this.props.entityId)
      .addClass('sc-entity-entry se-definition')
      .on('click', this.handleClick)
      .append(
        $$('div').addClass('se-title').append(this.props.data.title),
        $$('div').addClass('se-description').setInnerHTML(this.props.data.description)
      )

    return el
  }

  handleClick() {

  }

}

export default DefinitionContextItem