class Project < ApplicationRecord
  # field name is mandatory / can't be blank
  validates :name, presence: {message: "Did you forget to add a name?"}
end