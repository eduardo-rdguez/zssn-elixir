defmodule ZssnElixir.RouterTest do
  # A shorthand for a module Router
  alias ZssnElixir.Router

  # Provides to scope and configure it to run test in this module
  use ExUnit.Case, async: true

  # Makes the conn object available in the scope of the tests
  use Plug.Test

  @opts Router.init([])

  # Create a test with the name "return ok"
  test "return ok" do
    # Build a connection which is GET request
    conn = conn(:get, "/api/v1/survivors")
    conn = Router.call(conn, @opts)

    # Check the correctness of the response
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end
end
