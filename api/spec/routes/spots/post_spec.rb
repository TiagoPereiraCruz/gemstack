

describe "POST /spots" do
  context "when save spot" do
    before(:all) do
      result = SpotApi.new.session({ email: "tiago@cruz.io" })
      @user_id = result.parsed_response["_id"]
    end

    it "should return 200" do
      thumbnail = File.open(File.join(Dir.pwd, "spec/images", "google.jpg"))

      payload = {
        thumbnail: thumbnail,
        company: "Google",
        techs: "java, golang, node",
        price: "30",
      }

      MongoDb.new.remove_company("Google", @user_id)

      result = SpotApi.post(
        "/spots",
        body: payload,
        headers: { "user_id" => @user_id },
      )

      puts result.parsed_response

      expect(result.response.code).to eql "200"
    end
  end
end
