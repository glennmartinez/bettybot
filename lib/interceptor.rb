

module Interceptor


	def self.main(request)


		 message = request["item"]["message"]["message"]

		 response = Helpers.botrouter(message)

		 return response			


		
	end




end
