
describe Ppl::Format::AddressBook::PhoneNumbers do
  describe "#initialize" do
    it "should pass the colors through to the table" do
      colors = {"id" => "blue"}
      Ppl::Format::Table.should_receive(:new).with([:id, :phone_numbers], colors)
      format = Ppl::Format::AddressBook::PhoneNumbers.new(colors)
    end
  end
end

describe Ppl::Format::AddressBook::PhoneNumbers do

  before(:each) do
    @format       = Ppl::Format::AddressBook::PhoneNumbers.new
    @address_book = Ppl::Entity::AddressBook.new
    @contact      = Ppl::Entity::Contact.new
    @table        = double(Ppl::Format::Table)

    @contact.id = "test"
    @format.table = @table

    @address_book.contacts.push(@contact)
  end

  describe "#process" do

    it "should at least show the contact's id" do
      @table.should_receive(:add_row).with({
        :id            => "test:",
        :phone_numbers => "",
      })
      @format.process(@address_book)
    end

    it "should show the phone number if it's available" do
      @contact.phone_numbers.push("01234567890")
      @table.should_receive(:add_row).with({
        :id            => "test:",
        :phone_numbers => "01234567890",
      })
      @format.process(@address_book)
    end

  end

end

