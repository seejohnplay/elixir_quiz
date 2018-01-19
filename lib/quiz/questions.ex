defmodule Quiz.Questions do

	def start_link do
		Agent.start_link(&questions/0, name: __MODULE__)
	end

	def questions do
		"../../assets/questions.csv"
		|> Path.expand(__DIR__)
		|> File.stream!
		|> CSV.decode!(headers: true)
	end

  def all do
		Agent.get(__MODULE__, &(&1))
		|> Enum.to_list
	end
end
