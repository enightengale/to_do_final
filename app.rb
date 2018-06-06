require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/task")

get("/") do
  erb(:index)
end
