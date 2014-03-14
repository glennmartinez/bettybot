require 'ruby-standard-deviation'



module Scoresbot


#expected message is 'betty scores hedgehogs 7'
	def self.getScores(messageArray)
		
		command = messageArray[1]  #checks the command ie: scores, qanotes, help
		teamname = messageArrau[2] #gets first parameter such as 'teamname'
		weeks = messageArray[3] #gets second parameter such as number of weeks



		self.getTeamScore("muppets", 5)


	end


	def self.getTeamScore(teamname, teamweeks)
			bugScore = 0
			scoreArray = Array.new
			listArray = Array.new

			scorelist = Score.where(:teamname => teamname, :date.lte => (Time.now), :date.gte => (Time.now - teamweeks.weeks)).order_by(:date.asc)
			yearlylist = Score.where(:teamname => teamname, :date.lte => (Time.now), :date.gte => (Time.now - 52.weeks)).order_by(:date.asc)

			scorelist.each do |score|

				 bugScore +=	score.bugscore.to_i

			end

			yearlylist.each do |yearly|

					 scoreArray << yearly.bugscore.to_i

			end



			bugScore
			scoreArray.count 
			average = bugScore / scoreArray.count
			standardDev =  scoreArray.stdev.round(2)
		   "this is the BugScore" + " "   + "#{bugScore}" + " "
			 "this is the weekly average" + " "   + "#{average}" + " "
			 "this is the standar div" + " "   + "#{standardDev}"

			# listArray << "'Team:' + ' '  + '#{teamname}' + ' '"
			# listArray << "Total Bugscore:' + ' '   + '#{bugScore}' + ' '"
			# listArray << "'Weekly average:' + ' '    + '#{average}' + ' ' " 
			# listArray << "'Weekly Standard Div:' + " "   + '#{standardDev}'"

			listArray = "'#{teamname}'" +" " + "#{bugScore}" + " " + 'Weekly Average' + "#{average}"

			return listArray



	end





end