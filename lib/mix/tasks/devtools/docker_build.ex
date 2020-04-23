defmodule Mix.Tasks.Devtools.DockerBuild do
  use Mix.Task

  require Logger

  alias Mix.Devtools.Common

  @shortdoc "Docker build"
  def run(args) do
    path = "#{Common.scripts_path()}/docker-build"
    command_result = System.cmd(path, args)
    Logger.info(inspect(command_result))

    {_, 0} = command_result
  end
end
