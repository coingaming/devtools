defmodule Mix.Tasks.Devtools.Release do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  def run(["--minor"]) do
    path = "#{Common.path}/minor"
    {_, 0} = System.cmd(path, ["--minor"]) |> IO.inspect
  end

  @shortdoc "Prepare for release, use --minor for minor release"
  def run(args) do
    path = "#{Common.path}/release"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end
