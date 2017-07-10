RSpec.describe User, type: :model do
  let(:user) do
    User.new({
      email: "bob@bob.com",
      password: "password",
      password_confirmation: "password"
      })
  end
  let!(:admin) { Role.new(name: "Admin").save }
  let!(:owner) { Role.new(name: "Owner").save }
  let!(:student) { Role.new(name: "Student").save }

  it 'has many roles' do
    association = User.reflect_on_association(:roles)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many roles' do
    association = User.reflect_on_association(:posts)
    expect(association.macro).to eq(:has_many)
  end

  it '#admin? returns true with admin role' do
    user.roles << Role.admin
    expect(user.admin?).to be_truthy
  end

  it '#admin? returns true with owner role' do
    user.roles << Role.owner
    expect(user.admin?).to be_truthy
  end

  it '#admin? returns false with student role' do
    user.roles << Role.student
    expect(user.admin?).to be_falsey
  end

  it 'includes student role on save' do
    expect(user.roles.length).to eq(0)
    user.save
    expect(user.roles.length).to eq(1)
    expect(user.roles).to include(Role.student)
  end
end
