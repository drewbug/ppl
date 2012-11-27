
describe Ppl::Format::Contact::Full do

  before(:each) do
    @format  = Ppl::Format::Contact::Full.new
    @contact = Ppl::Entity::Contact.new
  end

  describe "#process" do

    it "should return an empty string if the contact lacks any properties" do
      @format.process(Ppl::Entity::Contact.new).should eq ""
    end

    it "should start with the contact's name" do
      @contact.name = "John Doe"
      @format.process(@contact).should eq "John Doe"
    end

    it "should include their email address in brackets" do
      @contact.name          = "John Doe"
      @contact.email_address = "john@example.org"
      @format.process(@contact).should eq "John Doe <john@example.org>"
    end

  end

end
