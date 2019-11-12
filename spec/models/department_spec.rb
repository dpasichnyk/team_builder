require 'rails_helper'

RSpec.describe Department, type: :model do
  it_behaves_like 'model with a factory'

  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end
end
