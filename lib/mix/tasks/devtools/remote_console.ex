defmodule Mix.Tasks.Devtools.RemoteConsole do
  use Mix.Task

  @shortdoc "Remote console"
  def run(args) do
    path = Path.join(File.cwd!(), "/scripts/remote-console")
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end