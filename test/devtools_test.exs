defmodule DevtoolsTest do
  use ExUnit.Case

  describe "pre-release" do
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

    test "adds pre-release" do
      assert Mix.Tasks.Devtools.Pre.run("v1.0.0") == "v1.0.0-0"
    end

    test "writes pre-release to mix.exs" do
      Mix.Tasks.Devtools.Pre.run("v1.0.0")

      result = assert String.match?(File.read!("mix.exs"), ~r/version:\s"\d+\.\d+\.\d+(-\d+)?\"/)
    end
  end
end
