defmodule ElixirQuiz.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(ElixirQuiz.Questions, [])
    ]

    opts = [
      strategy: :one_for_one,
      name: ElixirQuiz.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
