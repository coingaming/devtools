defmodule Mix.Tasks.Devtools.Release do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common
  
  @shortdoc "Prepare for release"
  def run(args) do
    path = "#{Common.path}/release"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end