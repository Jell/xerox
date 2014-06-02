defmodule SmallWeb do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    port = System.get_env("PORT") || "4000"
    IO.puts "Running MyPlug with Cowboy on http://localhost:"<>port
    Plug.Adapters.Cowboy.http MyPlug, [], [{:port, binary_to_integer(port)}]
    SmallWeb.Supervisor.start_link
  end
end
