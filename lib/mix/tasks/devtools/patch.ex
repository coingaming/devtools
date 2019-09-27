defmodule Mix.Tasks.Devtools.Patch do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    path = "#{Common.scripts_path()}/patch"
    {_, 0} = System.cmd("bash", [path]) |> IO.inspect()
  end
end
