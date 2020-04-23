defmodule Mix.Tasks.Devtools.DockerBuild do
  use Mix.Task

  alias Mix.Devtools.Common

  @shortdoc "Docker build"
  def run(args) do
    path = "#{Common.scripts_path()}/docker-build"
    System.cmd(path, args) |> IO.inspect()
  end
end
