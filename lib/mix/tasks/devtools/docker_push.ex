defmodule Mix.Tasks.Devtools.DockerPush do
  use Mix.Task
  
  @shortdoc "Docker push"
  def run(args) do
    path = Path.join(File.cwd!(), "/scripts/docker-push")
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end