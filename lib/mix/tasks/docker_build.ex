defmodule Mix.Tasks.DockerBuild do
  use Mix.Task
  require Logger

  @shortdoc "Docker build"
  def run(args) do
    System.cmd("#{__DIR__}/../../../scripts/docker-build", args) |> IO.inspect
  end
end