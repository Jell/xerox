defmodule SmallWeb do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
    Plug.Adapters.Cowboy.http MyPlug, []
    SmallWeb.Supervisor.start_link
  end
end
