

class Score

include Mongoid::Document
  store_in collection: "scores"

  field :teamname, type: String
  field :product, type: String 
  field :bugscore, type: Integer
  field :speedscore, type: Integer
  field :qascore, type: Integer
   
  # index({ key: 1 }, { unique: true, name: "plankey_index" })  

	


end