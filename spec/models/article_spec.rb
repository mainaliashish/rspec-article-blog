require 'rails_helper'

MAX_TITLE_LENGTH = 100
MIN_TITLE_LENGTH = 20
RSpec.describe Article, type: :model do
  it 'is not valid without a article title' do
    article = Article.new(title: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a article content' do
    article = Article.new(content: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a title longer than 100 characters' do
    title = 'a' * 100
    article = Article.new(title: title)
    expect(article.title.length).to be <= MAX_TITLE_LENGTH
  end

  it 'is not valid without a title shorter than 20 characters' do
    title = 'a' * 20
    article = Article.new(title: title)
    expect(article.title.length).to be <= MIN_TITLE_LENGTH
  end
end
