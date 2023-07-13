require_relative '../book'

describe Book do
  let(:book) { Book.new("Title", "Author") }
  let(:person) { double("Person") }
  let(:date) { double("Date") }

  describe "#initialize" do
    it "creates a new book object with the given title and author" do
      expect(book.title).to eq("Title")
      expect(book.author).to eq("Author")
      expect(book.rentals).to be_empty
    end
  end

  describe "#add_rental" do
    it "creates a new rental object and adds it to the book's rentals array" do
      rental = book.add_rental(person, date)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
    end
  end
end
