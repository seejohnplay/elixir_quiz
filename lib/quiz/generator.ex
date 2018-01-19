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

	defp inject_questions(list), do: inject_questions(list, Quiz.Questions.strands, [])
	defp inject_questions([], _, questions), do: questions
	defp inject_questions([chunk | chunks], [strand | strands], questions) do
		standards =
			Quiz.Questions.standards(strand)
			|> Stream.cycle()
			|> Enum.take(length(chunk))

		question_chunk = inject_questions_to_chunk(standards, strand, [])

		inject_questions(chunks, strands, questions ++ question_chunk)
	end

	defp inject_questions_to_chunk([], _, questions_chunk), do: questions_chunk
	defp inject_questions_to_chunk([standard | standards], strand, questions_chunk) do
		inject_questions_to_chunk(
			standards,
			strand,
			[Quiz.Questions.sample_by_strand_and_standard(strand, standard) | questions_chunk]
		)
	end
end
