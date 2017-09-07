defmodule MyApp do

  @http_client Application.get_env(:my_app, :http_client, HTTPoison)

  def fetch_facebook_profile(profile_id, http_client \\ @http_client) do
    response = http_client.get("https://api.facebook.com/#{profile_id}")
    case response do
      {:ok, json_profile} -> {:ok, json_profile}
      {:error, reason} -> {:error, "failed to fetch profile. REASON: #{reason}"}
    end
  end
end
