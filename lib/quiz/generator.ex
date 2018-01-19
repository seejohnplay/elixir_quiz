defmodule Quiz.Generator do
	def generate(number_of_questions) do
		1..number_of_questions
		|> Enum.chunk_every(chunk_length(number_of_questions))
		|> inject_questions()
	end

	defp chunk_length(number_of_questions) do
		number_of_questions
		|> Kernel./(length(Quiz.Questions.strands))
		|> Float.ceil()
		|> trunc()
	end

	defp inject_questions(list) do
		inject_questions(list, Quiz.Questions.strands, [])
	end
	defp inject_questions([], _, questions), do: questions
	defp inject_questions([head | tail], [strand | strand_tail], questions) do
		question_chunk =
			head
			|> Enum.map(fn _ -> Quiz.Questions.sample_by_strand(strand) end)
		inject_questions(tail, strand_tail, questions ++ question_chunk)
	end
end
