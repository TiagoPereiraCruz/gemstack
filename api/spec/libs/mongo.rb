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
    client = Mongo::Client.new("mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false")
    collection = client[:spots]
    query = { "company": company, "user": user_id }
    collection.delete_many(query)
  end
end
