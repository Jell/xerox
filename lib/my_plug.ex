defmodule MyPlug do
  import Plug.Conn
  use Plug.Router
  import Ecto.Query, only: [from: 2]

  plug :match
  plug :dispatch

  get "/hello/:people" do
    previous = find_by_name(people)
    message = if previous do
                "welcome back " <> people
              else
                Repo.insert(%Name{name: people})
                "hello " <> people
              end
    send_resp(conn, 200, message)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  def find_by_name (name) do
    result = Repo.all(from n in Name, where: n.name == ^name, limit: 1)
    List.first result
  end
end
