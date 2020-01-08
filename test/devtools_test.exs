defmodule DevtoolsTest do
  use ExUnit.Case

  setup_all do
    on_exit(fn ->
      checkout()
    end)

    :ok
  end

  def checkout() do
    System.cmd(
      "git",
      ~w[checkout mix.exs],
      stderr_to_stdout: true
    )
  end

  describe "pre-release" do
    test "adds pre-release" do
      assert Mix.Tasks.Devtools.Pre.run("v1.0.0") == "v1.0.0-0"
    end

    test "writes pre-release to mix.exs" do
      checkout()
      refute String.contains?(File.read!("mix.exs"), "1.0.0-0")

      Mix.Tasks.Devtools.Pre.run("v1.0.0")

      assert String.contains?(File.read!("mix.exs"), "1.0.0-0")
    end
  end
end
