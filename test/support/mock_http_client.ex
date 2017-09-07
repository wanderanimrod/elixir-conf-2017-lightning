defmodule Support.MockHttpClient do
  def get(_url) do
    {:ok, :dummy_profile}
  end
end