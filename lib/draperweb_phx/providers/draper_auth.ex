defmodule DraperwebPhx.Providers.DraperAuth do
  use Assent.Strategy.OAuth2.Base

  @impl true
  def default_config(_config) do
    [
      site: "https://auth.draper.net.za/application/o",
      authorize_url: "/authorize/",
      token_url: "/token/",
      user_url: "/userinfo/",
      auth_method: :client_secret_post
    ]
  end

  @impl true
  def normalize(_config, user) do
    {:ok,
     %{
       "sub" => user["sub"],
       "name" => user["name"],
       "nickname" => user["nickname"],
       "email" => user["email"]
     }}
  end
end
