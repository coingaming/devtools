defmodule DevtoolsTest do
  use ExUnit.Case
  doctest Devtools

  test "greets the world" do
    assert Devtools.hello() == :world
  end
end
