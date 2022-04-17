defmodule Words.Router do
  use Phoenix.Router

  pipeline :json_api do
    plug(Plug.Parsers, parsers: [{:json, json_decoder: Jason}])
  end

  scope "/api/v1/words", Words.Controllers do
    pipe_through(:json_api)

    get("sort", :ParserController, :sort)
    get("concat", :ParserController, :concat)
    get("snake_case", :ParserController, :snake_case)
    get("frequency", :ParserController, :frequency)
  end
end
