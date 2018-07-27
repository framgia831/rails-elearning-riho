class Activity < ApplicationRecord
  belongs_to :action, polymorphic: true
  default_scope -> { order(created_at: :desc) }
end
