defmodule MyApp do
  def fetch_facebook_profile(profile_id) do
    response = HTTPoison.get("https://api.facebook.com/#{profile_id}")
    case response do
      {:ok, json_profile} -> {:ok, json_profile}
      {:error, reason} -> {:error, "failed to fetch profile. REASON: #{inspect reason}"}
    end
  end
end
