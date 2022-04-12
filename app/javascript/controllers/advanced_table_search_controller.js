const { Controller } = require("@hotwired/stimulus")

class AdvancedTableSearchController extends Controller {
  static values = {
    advancedLabel: String,
  }

  static targets = [
    'showSearchHiddenInput',
    'toggleButton',
    'controlsContainer',
    'keywordSearchButton',
    'toggleableArea',
  ]

  connect() {
    /* global window */
    // Did the user initiate a search via the form? If so, reveal the form
    // on page load. The form is initially hidden.
    const searchParams = new URLSearchParams(window.location.search)
    if (searchParams.get('show_advanced_search') === 'true') {
      this.toggle()
    }
  }

  toggle() {
    this.toggleableAreaTarget.classList.toggle('hidden')

    this.keywordSearchButtonTarget.classList.toggle('hidden')

    const text = this.toggleableAreaTarget.classList.contains('hidden') ? 'Show' : 'Hide'
    this.toggleButtonTarget.innerText = `${text} ${this.advancedLabelValue}`

    const advancedSearchState = this.toggleableAreaTarget.classList.contains('hidden') ? 'false' : 'true'
    this.showSearchHiddenInputTarget.value = advancedSearchState

    const searchParams = new URLSearchParams(window.location.search)
    searchParams.set('show_advanced_search', advancedSearchState)
    const newRelativePathQuery = this._newRelativePathQuery(searchParams)
    window.history.pushState(null, '', newRelativePathQuery)
  }

  clear() {
    const searchParams = new URLSearchParams({ show_advanced_search: 'true' })
    window.location = this._newRelativePathQuery(searchParams)
  }

  _newRelativePathQuery(searchParams) {
    return `${window.location.pathname}?${searchParams.toString()}`
  }
}

export default AdvancedTableSearchController
