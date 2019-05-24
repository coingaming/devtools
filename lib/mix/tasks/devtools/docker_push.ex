defmodule Mix.Tasks.Devtools.DockerPush do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common
  
  @shortdoc "Docker push"
  def run(args) do
    path = "#{Common.path}/docker-push"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end