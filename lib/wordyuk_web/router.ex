defmodule WordyukWeb.Router do
  use WordyukWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Wordyuk.UserManager.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end
  
  scope "/", WordyukWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index

    resources "/pmitems", PMItemController

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    post "/logout", SessionController, :logout
  end

  scope "/", WordyukWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/secret", PageController, :secret
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", WordyukWeb do
  #   pipe_through :api
  # end
end
