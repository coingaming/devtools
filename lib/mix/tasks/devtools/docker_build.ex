defmodule Mix.Tasks.Devtools.DockerBuild do
  use Mix.Task

  @path "#{__DIR__}/../../../../scripts"
  
  @shortdoc "Docker build"
  def run(args) do
    {_, 0} = System.cmd("#{@path}/docker-build", args) |> IO.inspect
  end
end