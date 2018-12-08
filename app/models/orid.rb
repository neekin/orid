class Orid < ApplicationRecord
  belongs_to :user
  before_create :default_values
  def default_values
    self.public= false
  end
end
