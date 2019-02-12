defmodule Mix.Tasks.DockerPush do
  use Mix.Task
  require Logger

  @shortdoc "Docker push"
  def run(args) do
    System.cmd("#{__DIR__}/../../../scripts/docker-push", args) |> IO.inspect
  end
end