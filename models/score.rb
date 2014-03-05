

class Score

include Mongoid::Document
  store_in collection: "scores"

  field :teamname, type: String
  field :product, type: String 
  field :bugscore, type: Integer
  field :speedscore, type: Integer
  field :qascore, type: Integer
  field :date, type: String
   
   index({ key: 1 }, { unique: true, name: "teamname_index" })  

	


end