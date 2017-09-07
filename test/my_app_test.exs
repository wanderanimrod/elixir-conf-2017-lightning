defmodule MyAppTest do
  use ExUnit.Case

  test "should return profile returned by facebook api call" do
    profile_id = "B16C4D31-77E4-4AB7-9665-E0EEFC6233C9"

    {:ok, returned_profile} = MyApp.fetch_facebook_profile(profile_id)

    assert returned_profile == :dummy_profile
  end
end
