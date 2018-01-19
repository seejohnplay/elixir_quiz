defmodule Quiz.Questions do

	def start_link do
		Agent.start_link(&questions/0, name: __MODULE__)
	end

	def questions do
		"../../assets/questions.csv"
		|> Path.expand(__DIR__)
		|> File.stream!
		|> CSV.decode!(headers: true)
		|> Stream.map(fn question ->
			%{
				question_id: String.to_integer(question["question_id"]),
				standard_id: String.to_integer(question["standard_id"]),
				strand_id: String.to_integer(question["strand_id"])
			}
		end)
	end

  def all do
		Agent.get(__MODULE__, &(&1))
		|> Enum.to_list()
	end

	def strands do
		Agent.get(__MODULE__, &(&1))
		|> Stream.map(fn question -> question.strand_id end)
		|> Enum.uniq()
	end

	def standards(strand_id) do
		by_strand(strand_id)
		|> Stream.map(fn question -> question.standard_id end)
		|> Enum.uniq()
	end

	def by_strand(strand_id) do
		Agent.get(__MODULE__, &(&1))
		|> Stream.filter(fn question -> question.strand_id == strand_id end)
	end

	def sample_by_strand_and_standard(strand_id, standard_id) do
		Agent.get(__MODULE__, &(&1))
		|> Stream.filter(fn question ->
			question.strand_id == strand_id && question.standard_id == standard_id
		end)
		|> Enum.random()
	end
end
