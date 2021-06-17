class ProjectsController < ApplicationController
	def index
		projects = Project.includes(:todos).all

		render json: projects, include: ['todos']
	end

	def create
		project = Project.new project_params

		if project.save
			head :created
		else
			head :unprocessable_entity
		end
	end

	private

	def project_params
		params.require(:project).permit(:title)
	end
end
