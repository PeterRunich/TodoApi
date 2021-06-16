class Todo < ApplicationRecord
	belongs_to :project

	validates :text, :isCompleted, :project_id, presence: true
end
