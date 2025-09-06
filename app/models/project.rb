class Project < ApplicationRecord
  # project can have > 1 todo
  # dependent: :destroy = when a project is deleted, this will also delete all of its associated todos gets deleted as well
  has_many :todos, dependent: :destroy

  # field name is mandatory / can't be blank
  validates :name, presence: { message: "Did you forget to add a name?" }
end
