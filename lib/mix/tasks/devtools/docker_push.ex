defmodule Mix.Tasks.Devtools.DockerPush do
  use Mix.Task
  
  @path "#{__DIR__}/../../../../scripts"

  @shortdoc "Docker push"
  def run(args) do
    {_, 0} = System.cmd("#{@path}/docker-push", args) |> IO.inspect
  end
end