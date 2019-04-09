defmodule WordyukWeb.PageController do
  use WordyukWeb, :controller

  def secret(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "secret.html", current_user: user)
  end
  
  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", current_user: user, login_action: WordyukWeb.Router.Helpers.session_path(conn, :login))
  end
end
