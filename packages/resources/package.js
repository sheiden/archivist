import ResourcesContext from './ResourcesContext'
import { PagerPackage } from 'archivist'

export default {
  name: 'archivist-resources',
  configure: function(config) {
    config.import(PagerPackage)
    config.addContext('resources', ResourcesContext, false)
    config.addIcon('resources', {'fontawesome': 'fa-bullseye'})
    config.addIcon('goBackToList', {'fontawesome': 'fa-arrow-left'})
    config.addIcon('editReference', {'fontawesome': 'fa-pencil'})
    config.addIcon('removeReference', {'fontawesome': 'fa-trash'})
    config.addLabel('resources', {
      en: 'Resources',
      ru: 'Сущности'
    })
    config.addLabel('goBackToResources', {
      en: 'Resources',
      ru: 'К списку'
    })
    config.addLabel('editReference', {
      en: 'Edit',
      ru: 'Редактировать'
    })
    config.addLabel('removeReference', {
      en: 'Remove',
      ru: 'Удалить'
    })
    config.addLabel('searchPlaceholder', {
      en: 'Type to search...',
      ru: 'Поиск...'
    })
  }
}