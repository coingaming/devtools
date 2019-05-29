defmodule Mix.Tasks.Devtools.Minor do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Minor version change + tag creation"
  def run(args) do
    path = "#{Common.path}/minor"
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end
