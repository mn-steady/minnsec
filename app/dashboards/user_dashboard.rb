require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # These are the actual fields in the database and virtual fields for forms.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    display_name: Field::String,
    phone_number: Field::String,
    admin: Field::Boolean,
    password: Field::String.with_options(searchable: false), # Virtual field for form
    password_confirmation: Field::String.with_options(searchable: false), # Virtual field for form
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # This defines what shows up in the index view.
  COLLECTION_ATTRIBUTES = %i[
    id
    email
    first_name
    last_name
    display_name
    phone_number
    admin
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # This defines the attributes shown on the show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    first_name
    last_name
    display_name
    phone_number
    created_at
    updated_at
    admin
  ].freeze

  # FORM_ATTRIBUTES
  # This defines what attributes can be edited in the form views (new/edit).
  FORM_ATTRIBUTES = %i[
    email
    first_name
    last_name
    display_name
    phone_number
    password
    password_confirmation
    admin
  ].freeze

  # COLLECTION_FILTERS
  # This allows filtering of resources based on custom conditions.
  COLLECTION_FILTERS = {}.freeze

  # Custom display for users across admin dashboard
  def display_resource(user)
    "User: #{user.display_name || user.email}"
  end
end
