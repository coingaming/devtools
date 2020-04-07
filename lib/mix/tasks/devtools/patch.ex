defmodule Mix.Tasks.Devtools.Patch do
  use Mix.Task

  require Logger

  alias Mix.Tasks.Devtools.Versions

  @patch_regex ~r/(\d{1,})-(\d{1,})/

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    Versions.increment(&File.read/1, &File.write/2, &patch/1, "mix.exs")
  end

  # private 

  defp patch(current_version) when is_binary(current_version) do
    values = String.split(current_version, ".")

    if length(values) < 3 do
      {:error, "can not get version number, check version format, it should be \"n.n.n\""}
    else
      [_major, _minor, patch] = values

      patch
      |> increment_old_patch
      |> case do
        {:ok, new_pre_release} ->
          {:ok, construct_new_pre_release(values, new_pre_release)}
      end
    end
  end

  defp construct_new_pre_release(values, new_pre_release) do
    [major, minor, _] = values
    "#{major}.#{minor}.#{new_pre_release}"
  end

  defp increment_old_patch(old_patch) when is_binary(old_patch) do
    @patch_regex
    |> Regex.run(old_patch)
    |> case do
      nil ->
        increment_patch(old_patch)

      values ->
        values
        |> remove_pre_release()
        |> increment_patch()
    end
  end

  defp increment_patch(patch) when is_binary(patch) do
    {int_val, _} = Integer.parse(patch)
    {:ok, "#{int_val + 1}"}
  end

  defp remove_pre_release(values) when is_list(values) do
    if length(values) == 3 do
      [_everyting, current_patch, _current_pre_release] = values
      "#{current_patch}"
    else
      {:error, "can not remove pre-release"}
    end
  end
end
