defmodule MyAppTest do
  use ExUnit.Case

  test "should return profile returned by facebook api call" do
    profile_id = "B16C4D31-77E4-4AB7-9665-E0EEFC6233C9"
    {:ok, returned_profile} = MyApp.fetch_facebook_profile(profile_id)
    assert returned_profile == :dummy_profile
  end

  test "should return error string when facebook api returns error" do
    profile_id = "B16C4D31-77E4-4AB7-9665-E0EEFC6233C9"
    expected_error = "profile not found"

    defmodule MyAppTest.FakeClient do
      def get(_), do: {:error, "profile not found"}
    end

    {:error, error_details} = MyApp.fetch_facebook_profile(profile_id, MyAppTest.FakeClient)
    assert error_details == "failed to fetch profile. REASON: #{expected_error}"
  end
end
