require "administrate/base_dashboard"

class BlogPostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # A hash that describes the type of each of the model's fields.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    content: Field::Text,
    published: Field::Boolean,
    user: Field::BelongsTo.with_options(searchable: true, searchable_field: "email"),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  COLLECTION_ATTRIBUTES = %i[
    id
    title
    published
    user
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    content
    published
    user
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  FORM_ATTRIBUTES = %i[
    title
    content
    published
    user
  ].freeze

  # COLLECTION_FILTERS
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how blog posts are displayed
  # across all pages of the admin dashboard.
  def display_resource(blog_post)
    blog_post.title
  end
end
