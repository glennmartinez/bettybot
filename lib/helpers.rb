


module Helpers


	def self.botrouter(message)

		messageArray = message.split
		command = messageArray[1]  #checks the command ie: scores, qanotes, help
        $logger.debug "command name #{command}"        
  

		if command == "scores"

			response = Scoresbot.getScores(messageArray)

		elsif command == "qanotes"

			response "you hit the qanotes"

		else command == "help"

			response = "Sorry Betty Don't play that! " + "#{command}"
		end


		
	end



	

end