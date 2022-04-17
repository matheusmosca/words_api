defmodule Words.Endpoint do
  use Phoenix.Endpoint, otp_app: :words

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(Words.Router)
end
