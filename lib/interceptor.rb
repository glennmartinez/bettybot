

module Interceptor


	def self.main(request)


		 message = request["item"]["message"]["message"]
		 teamname = messageArrau[2].to_s #gets first parameter such as 'teamname'
		 weeks = messageArray[3] #gets second parameter such as number of weeks
		 # response = Helpers.botrouter(message)
		 getscores = Scoresbot.getTeamScore(teamname, 10)

		 return getscores			


		
	end




end
