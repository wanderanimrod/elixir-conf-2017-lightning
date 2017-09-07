defmodule MyAppTest do
  use ExUnit.Case, async: true # mocks share no state so tests can run in parallel.
  require ElixirMock
  import ElixirMock

  test "demonstrating characteristics of mocks" do
    fake_nil_client = mock_of HTTPoison # one-liner nil-mock definition. Same API as HTTPoison

    with_mock(custom_fake_client) = defmock_of HTTPoison do
      def get(_), do: {:ok, :custom_response}
    end

    assert fake_nil_client.get("https://google.com") == nil

    # mocks are independent
    assert custom_fake_client.get("https://google.com") == {:ok, :custom_response}

    # the real module HTTPoison is not affected
    {:ok, real_response} = HTTPoison.get("https://google.com")
    assert real_response.body == "<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>301 Moved</TITLE></HEAD><BODY>\n<H1>301 Moved</H1>\nThe document has moved\n<A HREF=\"https://www.google.com/\">here</A>.\r\n</BODY></HTML>\r\n"
  end
end
