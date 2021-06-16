class TodosController < ApplicationController
	def create
		todo = Todo.new todo_params

		if todo.save
			head :created
		else
			head :unprocessable_entity
		end
	end

	def update
		todo = Todo.find_by id: params[:todo_id]

		todo.update todo_params

		render json: todo, status: :ok
	end

	private

	def todo_params
		params.require(:todo).permit(:text, :isCompleted, :project_id)
	end
end
