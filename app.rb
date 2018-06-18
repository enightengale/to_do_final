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

get("/list/:id") do
  @list = List.find(params.fetch("id").to_i())
  @lists = List.all()
  erb(:list)
end
