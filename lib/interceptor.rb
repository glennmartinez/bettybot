

module Interceptor


	def self.main(request)


		 message = request["item"]["message"]["message"]
  	 messageArray = message.split

  	 command = messageArray[1].to_s
		 teamname = messageArray[2].to_s #gets first parameter such as 'teamname'
		 weeks = messageArray[3] #gets second parameter such as number of weeks
		 # response = Helpers.botrouter(message)
		 if command == "scores"

		 	command = messageArray[1].to_s
		 	teamname = messageArray[2].to_s #gets first parameter such as 'teamname'
		 	weeks = messageArray[3] #gets second parameter such as number of weeks

			getscores = Scoresbot.getTeamScore(teamname, weeks.to_i)

			return getscores			

		 else 


		 	getscores = "Unknown command, please type: 'betty scores teamname weeks"

		 	return getscores			
		 end

		
	end




end
