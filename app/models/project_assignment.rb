class ProjectAssignment < ApplicationRecord
  belongs_to :member
  belongs_to :project

  validates :member, uniqueness: {scope: :project}
end
