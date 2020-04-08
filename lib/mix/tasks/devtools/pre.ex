defmodule Mix.Tasks.Devtools.Pre do
  use Mix.Task

  require Logger

  alias Mix.Devtools.Versions

  @pre_release_regex ~r/(\d{1,})-(\d{1,})/

  @shortdoc "Pre-release version increment"
  def run(_args) do
    %Versions{incrementer: &pre_release/1}
    |> Versions.increment()
  end

  # private 

  defp pre_release([_major, _minor, patch] = version) do
    patch
    |> increment_old_pre_release
    |> case do
      {:ok, new_pre_release} ->
        {:ok, construct_new_pre_release(version, new_pre_release)}

      {:error, error} ->
        {:error, error}
    end
  end

  defp construct_new_pre_release(values, new_pre_release) do
    [major, minor, _] = values
    "#{major}.#{minor}.#{new_pre_release}"
  end

  defp increment_old_pre_release(old_pre_release) when is_binary(old_pre_release) do
    @pre_release_regex
    |> Regex.run(old_pre_release)
    |> case do
      nil ->
        add_pre_release(old_pre_release)

      values ->
        increment_pre_release(values)
    end
  end

  defp add_pre_release(patch) when is_binary(patch) do
    {:ok, "#{patch}-0"}
  end

  defp increment_pre_release(values) when is_list(values) do
    if length(values) == 3 do
      [_everyting, current_patch, current_pre_release] = values
      {int_val, _} = Integer.parse(current_pre_release)

      {:ok, "#{current_patch}-#{int_val + 1}"}
    else
      {:error, "can not increment pre-release"}
    end
  end
end
