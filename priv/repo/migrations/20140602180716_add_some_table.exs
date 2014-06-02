defmodule Repo.Migrations.AddSomeTable do
  use Ecto.Migration

  def up do
    "CREATE TABLE IF NOT EXISTS names(id serial primary key, name text)"
  end

  def down do
    "DROP TABLE names"
  end
end
