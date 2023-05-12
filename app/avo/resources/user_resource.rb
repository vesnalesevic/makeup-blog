class UserResource < Avo::BaseResource

    field :id, as: :id, link_to_resource: true
    field :email, as: :text
    field :role, as: :select, enum: ::User.roles, display_with_value: true, placeholder: 'Choose the type of the container.'

  end