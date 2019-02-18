defmodule Mix.Tasks.Devtools.DockerBuild do
  use Mix.Task

  @shortdoc "Docker build"
  def run(args) do    
    path = Path.join(File.cwd!(), "/deps/devtools/scripts/docker-build")
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end