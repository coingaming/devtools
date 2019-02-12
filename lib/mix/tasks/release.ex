defmodule Mix.Tasks.Release do
  use Mix.Task
  require Logger

  @shortdoc "Prepare for release"
  def run(args) do
    System.cmd("#{__DIR__}/../../../scripts/release.sh", args) |> IO.inspect
  end
end