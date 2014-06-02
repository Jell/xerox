defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    string = System.get_env("DATABASE_URL") || "ecto://Jell@localhost/Jell"
    parse_url string
  end

  def priv do
    app_dir(:small_web, "priv/repo")
  end
end

defmodule Name do
  use Ecto.Model

  # weather is the DB table
  schema "names" do
    field :name,    :string
  end
end