require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "POST /projects" do
    it 'should create new project' do
      params = { title: 'test' }

      post "/projects", params: { project: params }
      parsed_body = JSON.parse response.body

      expect(parsed_body.except('id').to_json).to eq(params.to_json)
      expect(response).to have_http_status(:created)
    end

    it 'should return satus code when request data not valid' do
      post "/projects", params: { project: { title: ''} }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
