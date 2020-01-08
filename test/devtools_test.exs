defmodule DevtoolsTest do
  use ExUnit.Case

  setup_all do
    on_exit(fn ->
      System.cmd(
        "git",
        ~w[checkout .],
        stderr_to_stdout: true
      )
    end)

    :ok
  end

  describe "pre-release" do
    test "adds pre-release" do
      assert Mix.Tasks.Devtools.Pre.run("v1.0.0") == "v1.0.0-0"
    end

    test "writes pre-release to mix.exs" do
      Mix.Tasks.Devtools.Pre.run("v1.0.0")

      assert String.contains?(File.read!("mix.exs"), "v1.0.0")
    end
  end
end
