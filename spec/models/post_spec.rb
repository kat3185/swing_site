RSpec.describe Post, type: :model do

  let(:user) do
    User.new({
      id: 1
    })
  end

  let(:empty_post) { Post.new }

  let(:post) do
    Post.new(title: "Mah Post", body: "This is a post", user: user)
  end

  it '#belongs to a user' do
    association = Post.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it '#fails to save with invalid attributes' do
    expect(empty_post).to_not be_valid
    expect(empty_post.errors.messages.length).to eq(4)
  end

  it '#requires a title to save' do
    post.title = nil
    expect(post).to_not be_valid
    expect(post.errors[:title].length).to eq(1)
  end

  it '#requires a body to save' do
    post.body = nil
    expect(post).to_not be_valid
    expect(post.errors[:body].length).to eq(1)
  end

  it '#requires a body to save' do
    post.user = nil
    expect(post).to_not be_valid
    expect(post.errors[:user].length).to eq(1)
    expect(post.errors[:user_id].length).to eq(1)
  end

  it '#saves with valid attributes' do
    expect(post).to be_valid
  end

end
