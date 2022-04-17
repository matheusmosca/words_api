defmodule Words.Router do
  use Phoenix.Router

  pipeline :json_api do
    plug(Plug.Parsers, parsers: [{:json, json_decoder: Jason}])
  end

  scope "/api/v1/words", Words.Controllers do
    pipe_through(:json_api)

    get("/sort", Parser, :sort)
    get("/concat", Parser, :concat)
    get("/snake_case", Parser, :snake_case)
    get("/frequency", Parser, :frequency)
  end
end
