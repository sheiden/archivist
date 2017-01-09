import { Component } from 'substance'

class PersonContextItem extends Component {

  render($$) {
    let el = $$('div')
      .attr("data-id", this.props.entityId)
      .addClass('sc-entity-entry se-person')
      .on('click', this.handleClick)
      .append(
        $$('div').addClass('se-title').append(this.props.data.name),
        $$('div').addClass('se-description').setInnerHTML(this.props.data.description)
      )

    return el
  }

  handleClick() {
    this.send('switchActive', this.props.entityType, this.props.entityId)
    this.send('showReferences', this.props.entityId)
  }

}

export default PersonContextItem