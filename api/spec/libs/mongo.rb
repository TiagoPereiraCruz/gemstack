require "mongo"

# Mongo::Logger.logger.level = Logger::INFO
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

# host: ds035664.mlab.com
# port: 35664
# Database: spotdb
# user: qaninja
# Password: qaninja123

class MongoDb
  def remove_company(company, user_id)
    query = { company: company, user: user_id.to_mongo_id }
    spots.delete_many(query)
  end

  def save_spots(spot_list)
    spots.delete_many({ user: spot_list.first[:user] })
    spots.insert_many(spot_list)
  end

  def save_spot(spot)
    spots.delete_many({ user: spot[:user] })
    result = spots.insert_one(spot)
    result.inserted_id
  end

  def mongo_id
    BSON::ObjectId.new
  end

  private

  def spots
    client[:spots]
  end

  def users
    client[:users]
  end

  def client
    Mongo::Client.new("mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false")
  end
end
