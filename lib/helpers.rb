


module Helpers


	def self.botrouter(message)

		messageArray = message.split
		command = messageArray[1]  #checks the command ie: scores, qanotes, help
		  

		if command == "scores"

			response = Scoresbot.getScores(messageArray)
			puts "hello"

		elsif command == "qanotes"



		else command == "help"


		end


		
	end



	

end