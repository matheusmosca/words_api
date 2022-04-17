defmodule Words.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Words.Worker.start_link(arg)
      # {Words.Worker, arg}
      Words.Endpoint
    ]

    Application.put_env(:phoenix, :json_library, Jason)

    Application.put_env(:words, Words.Endpoint,
      http: [ip: {127, 0, 0, 1}, port: 5001],
      server: true,
      secret_key_base: String.duplicate("s", 64)
    )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Words.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
