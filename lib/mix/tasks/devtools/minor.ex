defmodule Mix.Tasks.Devtools.Minor do
  use Mix.Task

  require Logger

  alias Mix.Devtools.Versions

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    %Versions{
      content_getter: &File.read/1,
      content_setter: &File.write/2,
      incrementer: &minor/1,
      file_name: "mix.exs"
    }
    |> Versions.increment()
  end

  # private 

  defp minor([_major, minor, _patch] = version) do
    minor
    |> increment_old_minor
    |> case do
      {:ok, new_release} ->
        {:ok, construct_new_release(version, new_release)}
    end
  end

  defp construct_new_release(values, new_minor) do
    [major, _minor, _] = values
    "#{major}.#{new_minor}.0"
  end

  defp increment_old_minor(old_minor) when is_binary(old_minor) do
    {int_val, _} = Integer.parse(old_minor)
    {:ok, "#{int_val + 1}"}
  end
end
