require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'should return the correct books' do
    author = Author.create(name: 'Kimberly & James Dean')
    Book.create(title: 'Pete the Cat and the Missing Cupcakes', author_id: author.id)
    Book.create(title: 'Pete the Cat I Love My White Shoes', author_id: author.id)
    Book.create(title: 'Pete the Cat Valentiens Day Is Cool', author_id: author.id)
    Book.create(title: 'Pete the Cat Wacky Taco Tuesday', author_id: author.id)
    Book.create(title: 'Pete the Cat and His Magic Sunglasses', author_id: author.id)
    
    expect(author.books.to_json).to eq(Book.all.to_json)
  end
    it 'should also delete books when deleted' do
      author = Author.create(name: 'Kimberly & James Dean')
      Book.create(title: 'Pete the Cat and the Missing Cupcakes', author_id: author.id)
      Book.create(title: 'Pete the Cat I Love My White Shoes', author_id: author.id)
      Book.create(title: 'Pete the Cat Valentiens Day Is Cool', author_id: author.id)
      Book.create(title: 'Pete the Cat Wacky Taco Tuesday', author_id: author.id)
      Book.create(title: 'Pete the Cat and His Magic Sunglasses', author_id: author.id)
      author.destroy
      expect(Book.all.to_a).to eq([])
    end
end
