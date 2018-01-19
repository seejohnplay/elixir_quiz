defmodule Quiz.Mixfile do
  use Mix.Project

  def project do
    [
      app: :quiz,
      version: "0.1.0",
      escript: escript(),
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp escript do
    [main_module: Quiz.CLI]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Quiz.Application, []}
    ]
  end

  defp deps do
    [
      {:csv, "~> 2.0.0"}
    ]
  end
end
