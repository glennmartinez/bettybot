require 'ruby-standard-deviation'



module Scoresbot


#expected message is 'betty scores hedgehogs 7'
	def self.getScores(messageArray)

		command = messageArray[1]  #checks the command ie: scores, qanotes, help
		teamname = messageArrau[2].to_s #gets first parameter such as 'teamname'
		weeks = messageArray[3] #gets second parameter such as number of weeks



		self.getTeamScore("muppets", weeks)


	end


	def self.getTeamScore(teamname, teamweeks)
			bugScore = 0
			yearlyBugScore = 0
			scoreArray = Array.new
			listArray = Array.new
			responseArray = Array.new

			scorelist = Score.where(:teamname => teamname, :date.lte => (Time.now), :date.gte => (Time.now - teamweeks.weeks)).order_by(:date.asc)
			yearlylist = Score.where(:teamname => teamname, :date.lte => (Time.now), :date.gte => (Time.now - 12.weeks)).order_by(:date.asc)

			scorelist.each do |score|

				 bugScore +=	score.bugscore.to_i

			end

			yearlylist.each do |yearly|

					 yearlyBugScore += yearly.bugscore.to_i
					 scoreArray << yearly.bugscore.to_i

			end

			bugScoreAverage = bugScore / teamweeks
			scoreArray.count
			averageScore = yearlyBugScore / scoreArray.count
			standardDev =  scoreArray.stdev.round(2)

			responseColour = self.getResponseColour(bugScoreAverage, averageScore)

			testmachine = "Weekly Average:" + "<b>#{bugScoreAverage} </b>" + ",  3 Month Avg:" + "#{averageScore}" + ", 3 Month Std Deviation:" + "#{standardDev}" + "<br><img src='http://upload.wikimedia.org/wikipedia/en/5/5e/Betty_Rubble.png' width='62' height='120'/>"

			responseArray << responseColour
			responseArray << testmachine

			return responseArray


	end



	def self.getResponseColour(teamScore, averageScore)

		if teamScore <= averageScore

			colour = 'green'
		else
			colour = 'red'

	  end
	end


	def self.supertest

			scorelist = Score.where(:teamname => "muppets", :date.lte => (Time.now), :date.gte => (Time.now - 1.weeks)).order_by(:date.asc)

			scorelist.each do |score|

				 bugScore +=	score.bugscore.to_i

			end




			bugScore


		test = "super return"

		return bugScore.to_s

	end





end
