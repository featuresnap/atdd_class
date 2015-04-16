require 'rspec'
require 'page-object'
require 'require_all'

World(PageObject::PageFactory)


require_all 'features/support/pages'
PageObject::PageFactory.routes = {
    default: [
        [HomePage, :select_puppy],
        [DetailsPage, :adopt_me],
        [CartPage, :complete_adoption],
        [OrderPage, :checkout]
    ]
}