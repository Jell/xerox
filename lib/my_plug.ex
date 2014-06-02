defmodule MyPlug do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello/:people" do
    send_resp(conn, 200, "hello " <> people)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
