class Todo < ApplicationRecord
	belongs_to :project

	validates :text, :project_id, presence: true
	validates_inclusion_of :isCompleted, in: [true, false]
end
