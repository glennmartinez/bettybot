

module Interceptor


	def self.main(request)


		 message = request["item"]["message"]["message"]

		 # response = Helpers.botrouter(message)
		 getscores = Scoresbot.getTeamScore("muppets", 2)

		 return getscores			


		
	end




end
