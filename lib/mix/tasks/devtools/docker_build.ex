defmodule Mix.Tasks.Devtools.DockerBuild do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Docker build"
  def run(args) do    
    path = "#{Common.path}/docker-build"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end