defmodule MyAppTest do
  use ExUnit.Case
  require ElixirMock
  import ElixirMock # because coding past midnight causes bugs.

  test "should return error string when facebook api returns error" do
    profile_id = "B16C4D31-77E4-4AB7-9665-E0EEFC6233C9"
    expected_error = "profile not found"

    with_mock(fake_client) = defmock_of HTTPoison do
      def get(_), do: {:error, "profile not found"}
    end

    {:error, error_details} = MyApp.fetch_facebook_profile(profile_id, fake_client)
    assert error_details == "failed to fetch profile. REASON: #{expected_error}"
  end
end
