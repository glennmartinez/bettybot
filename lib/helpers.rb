


module Helpers


	def self.botrouter(message)

		messageArray = message.split
		command = messageArray[1]  #checks the command ie: scores, qanotes, help
		  

		if command == "scores"

			response = Scoresbot.getScores(messageArray)

		elsif command == "qanotes"



		else command == "help"

			response = "Sorry Betty Don't play that!"
		end


		
	end



	

end