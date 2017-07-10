RSpec.describe Role, type: :model do
  let(:role) { Role.new(name: "Admin") }

  it 'is valid with a name' do
    expect(role).to be_valid
  end

  it 'is invalid without a name' do
    role.name = nil
    expect(role).to_not be_valid
  end
end
