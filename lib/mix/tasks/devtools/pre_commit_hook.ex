defmodule Mix.Tasks.Devtools.PreCommitHook do
  use Mix.Task

  @pre_commit_hook_path ".git/hooks"
  @pre_commit_file_name "pre-commit"

  defp pre_commit_file() do
    "#{@pre_commit_hook_path}/#{@pre_commit_file_name}"
  end

  @shortdoc "Create pre-commit hook"
  def run(_args) do
    """
    #!/bin/bash
    mix format
    mix credo
    """
    |> write_file()
    |> change_file_permissions()
  end

  defp write_file(content) do
    File.write(pre_commit_file(), content)
  end

  defp change_file_permissions(:ok) do
    File.chmod!(pre_commit_file(), 0o755)
  end
end
