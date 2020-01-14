defmodule Mix.Tasks.Devtools.Pre do
  use Mix.Task

  # alias Mix.Tasks.Devtools.Common

  defp version("") do
    case System.cmd(
           "git",
           ~w[describe --tags],
           stderr_to_stdout: true
         ) do
      {version, 0} ->
        process(version)

      _ ->
        "0.0.0-dev"
    end
  end

  defp version(tag) do
    process(tag)
  end

  defp process(tag) do
    tag
    |> remove_v()
    |> String.trim()
    |> Version.parse()
    |> patch_version()
    |> to_string()

    # |> add_v_back()
  end

  defp remove_v("v" <> version), do: version
  defp remove_v(s), do: s

  defp add_v_back(s), do: "v" <> s

  defp patch_version({:ok, %Version{pre: []} = version}) do
    struct(version, pre: [0])
  end

  defp patch_version({:ok, %Version{pre: [_] = p} = version}) do
    struct(version, pre: [p + 1])
  end

  defp patch_version({:ok, %Version{} = version}),
    do: version

  defp replace_version(line, version) do
    if String.match?(line, ~r/version:\s"\d+\.\d+\.\d+(-\d+)?\"/) do
      String.replace(line, ~r/version:\s"\d+\.\d+\.\d+(-\d+)?\"/, "version: \"#{version}\"")
    else
      line
    end
  end

  @shortdoc "Version prerelease + tag creation"
  def run(tag) do
    new_version = version(tag)

    File.stream!("mix.exs")
    |> Stream.map(&replace_version(&1, new_version))
    |> Stream.into(File.stream!("output.tx"))
    |> Stream.run()

    File.cp!("output.tx", "mix.exs")
    File.rm!("output.tx")

    add_v_back(new_version)
  end
end
