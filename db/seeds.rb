data = YAML.load_file('./db/seeds.yml')

data['projects'].each do |project|
	saved_project = Project.create title: project['title']

	project['todos'].each do |todo|
		Todo.create text: todo['text'], isCompleted: todo['isCompleted'], project_id: saved_project.id
	end
end

