defmodule Quiz.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Quiz.Questions, [])
    ]

    opts = [
      strategy: :one_for_one,
      name: Quiz.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
