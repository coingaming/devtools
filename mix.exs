defmodule Devtools.MixProject do
  use Mix.Project

  def project do
    [
      app: :devtools,
      version: "2.0.8",
      elixir: "~> 1.12",
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
      files: ["lib", "scripts", "mix.exs", "README*"],
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
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
