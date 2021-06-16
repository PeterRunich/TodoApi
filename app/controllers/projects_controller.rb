class ProjectsController < ApplicationController
	def index
		projects = Project.includes(:todos).all

		render json: projects, include: ['todos']
	end
end
