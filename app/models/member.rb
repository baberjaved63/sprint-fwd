class Member < ApplicationRecord
  belongs_to :team
  has_many :project_assignments, dependent: :destroy
  has_many :projects, through: :project_assignments

  validates :first_name, :last_name, presence: true
end
