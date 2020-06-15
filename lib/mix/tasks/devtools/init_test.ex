defmodule Mix.Tasks.Devtools.InitTest do
  use Mix.Task

  require Logger

  @shortdoc "Create test file"
  def run(args) do
    if File.exists?(args) do
      args
      |> hd()
      |> set_test_dir()
      |> set_test_file_name()
      |> make_sure_dir_exists()
      |> touch_empty_test_file()
    else
      Logger.error("Can not find file #{inspect(args)}, make sure it exists")
    end
  end

  defp set_test_dir(args) do
    String.replace(args, "lib", "test")
  end

  defp set_test_file_name(args) do
    new_file_name =
      original_name(args)
      |> String.replace(".ex", "_test.exs")

    dir_name(args) <> new_file_name
  end

  defp make_sure_dir_exists(args) do
    args
    |> dir_name()
    |> File.mkdir_p()

    args
  end

  defp touch_empty_test_file(args) do
    File.touch(args)
  end

  defp dir_name(args) do
    String.replace(args, original_name(args), "")
  end

  defp original_name(args) do
    args
    |> String.split("/")
    |> List.last()
  end
end
