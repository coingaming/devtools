defmodule Mix.Tasks.Devtools.Release do
  use Mix.Task
  
  @path "#{__DIR__}/../../../../scripts"

  @shortdoc "Prepare for release"
  def run(args) do
    {_, 0} = System.cmd("#{@path}/release.sh", args) |> IO.inspect
  end
end