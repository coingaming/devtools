defmodule Devtools.MixProject do
  use Mix.Project

  def project do
    [
      app: :devtools,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  defp description do
    """
    Dev tools
    """
  end

  defp package do
    [
      name: "devtools",
      files: ["lib", "scripts",mix hex.publish  "mix.exs", "README*"],
      maintainers: ["ekaterinak@heathmont.net"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/coingaming/devtools"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
