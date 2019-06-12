defmodule Mix.Tasks.Devtools.RemoteConsole do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Remote console"
  def run(args) do
    path = "#{Common.scripts_path}/remote-console"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end
