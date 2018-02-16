defmodule ElixirQuiz.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_quiz,
      version: "0.1.0",
      escript: escript(),
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp escript do
    [main_module: ElixirQuiz.CLI]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirQuiz.Application, []}
    ]
  end

  defp deps do
    [
      {:csv, "~> 2.0.0"}
    ]
  end
end
