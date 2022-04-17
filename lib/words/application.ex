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

    host = System.get_env("PHX_HOST") || "localhost"
    port = System.get_env("PORT") || 5001
    secret_key_base = System.get_env("SECRET_KEY_BASE")

    Application.put_env(:words, Words.Endpoint,
      url: [host: host, port: port],
      http: [
        # Enable IPv6 and bind on all interfaces.
        # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
        # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
        # for details about using IPv6 vs IPv4 and loopback vs public addresses.
        ip: {0, 0, 0, 0, 0, 0, 0, 0},
        port: port
      ],
      server: true,
      secret_key_base: secret_key_base
    )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Words.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
