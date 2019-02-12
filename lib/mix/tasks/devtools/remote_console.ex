defmodule Mix.Tasks.Devtools.RemoteConsole do
  use Mix.Task

  @path "#{__DIR__}/../../../../scripts"

  @shortdoc "Remote console"
  def run(args) do
    {_, 0} = System.cmd("#{@path}/remote-console", args) |> IO.inspect
  end
end