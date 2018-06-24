require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/task")
require("./lib/list")

get("/") do
  erb(:index)
end

get("/lists/create") do
  @lists = List.all()
  erb(:list_create)
end

post("/lists/create") do
  @lists = List.all()
  name = params.fetch("name")
  new_list = List.new({:name => name})
  new_list.save()
  redirect("/lists")
end

get("/lists") do
  @lists = List.all()
  erb(:lists)
end

post("/lists") do
  @lists = List.all()
  @tasks = Task.all()
  description = params.fetch("description")
  list_id = params.fetch("list_id")
  @task = Task.new({:description => description, :done => false, :list_id => list_id})
  if @task.save()
    erb(:task_success)
  else
    erb(:task_error)
  end
end

delete("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @list.delete()
  @lists = List.all()
  redirect("/lists")
end

get("/list/:id") do
  @list = List.find(params.fetch("id").to_i())
  @lists = List.all()
  @tasks = Task.all()

  erb(:list)
end

post("/list/:id") do
  @list = List.find(params.fetch("id").to_i())
  @lists = List.all()
  @tasks = Task.all()
  description = params.fetch("description")
  new_task = Task.new({:description => description, :done => false})
  new_task.save()
  erb(:list)
end
