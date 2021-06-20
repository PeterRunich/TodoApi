require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "POST /todos" do
    it 'should create new todo' do
      new_project = Project.create title: 'test' 
      params = { text: 'test', isCompleted: true, project_id: new_project.id }

      post "/todos", params: { todo: params }
      parsed_body = JSON.parse response.body

      expect(parsed_body.except('id').to_json).to eq(params.to_json)
      expect(response).to have_http_status(:created)
    end

    it 'should return satus code when request data not valid' do
      new_project = Project.create title: 'test' 
      params = { text: 'test', project_id: new_project.id }

      post "/todos", params: { todo: params }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /todos" do
    it 'should update todo' do
      new_project = Project.create title: 'test' 
      new_todo = Todo.create text: 'test', isCompleted: true, project_id: new_project.id

      patch "/projects/#{new_project.id}/todo/#{new_todo.id}", params: { todo: { text: 'new text' } }
      parsed_body = JSON.parse response.body

      expect(parsed_body['text']).to eq('new text')
      expect(response).to have_http_status(:ok)
    end
  end
end
