defmodule ElixirQuiz.CLI do
  def main(argv) do
    argv
    |> OptionParser.parse()
    |> run()
  end

  def run({_, [], _}), do: print_usage()

  def run({_, [input | _], _}) do
    number_of_questions = String.trim(input)

    cond do
      number_of_questions =~ ~r/\A\d+\z/ && String.to_integer(number_of_questions) > 0 ->
        number_of_questions
        |> String.to_integer()
        |> ElixirQuiz.Generator.generate()
        |> Stream.map(fn question -> question.question_id end)
        |> Enum.join(", ")
        |> IO.puts()

      true ->
        print_usage()
    end
  end

  def print_usage() do
    IO.puts("Usage: ./elixir_quiz {number_of_questions}")
    IO.puts("number_of_questions needs to be a positive integer")
  end
end
