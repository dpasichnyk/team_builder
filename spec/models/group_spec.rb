require 'rails_helper'

RSpec.describe Group, type: :model do
  it_behaves_like 'model with a factory'

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to belong_to(:admin) }
  end

  describe 'scopes' do
    describe '.active' do
      subject { described_class.active }

      let!(:active_group) { create me, active: true }
      let!(:inactive_groups) { create_list me, 3, active: false }

      it { is_expected.to eq [active_group] }
    end
  end
end
