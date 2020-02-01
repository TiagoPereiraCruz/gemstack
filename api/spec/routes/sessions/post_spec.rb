describe ("POST /sessions") do
  context "when send email" do
    before(:all) do
      @result = SpotApi.new.session({ email: "tiago@cruz.io" })
    end

    it "should return 200" do
      expect(@result.response.code).to eql "200"
    end

    it "should return session id" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "when send wrong email" do
    before(:all) do
      @result = SpotApi.new.session({ email: "tiago&cruz.io" })
    end

    it "should return 409" do
      expect(@result.response.code).to eql "409"
    end

    it "should return wrong email" do
      expect(@result.parsed_response["error"]).to eql "wrong email"
    end
  end

  context "when send empty email" do
    before(:all) do
      @result = SpotApi.new.session({ email: "" })
    end

    it "should return 412" do
      expect(@result.response.code).to eql "412"
    end

    it "should return required email" do
      expect(@result.parsed_response["error"]).to eql "required email"
    end
  end

  context "when send without data" do
    before(:all) do
      @result = SpotApi.new.session({})
    end

    it "should return 412" do
      expect(@result.response.code).to eql "412"
    end

    it "should return required email" do
      expect(@result.parsed_response["error"]).to eql "required email"
    end
  end
end
