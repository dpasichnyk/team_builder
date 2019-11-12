require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like 'model with a factory'

  describe 'associations' do
    it { is_expected.to belong_to(:department) }
    it { is_expected.to have_and_belong_to_many(:groups) }
    it { is_expected.to have_and_belong_to_many(:questionnaires) }
  end

  describe 'validations' do
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.to_not allow_value('@email@example!.com').for(:email) }

    it { is_expected.to validate_length_of(:first_name).is_at_least(1).is_at_most(250) }

    it { is_expected.to validate_length_of(:last_name).is_at_least(1).is_at_most(250) }
  end

  describe 'instance methods' do
    let!(:admin_user) { create :user }
    let!(:active_group) { create :group, active: true, admin: admin_user }
    let!(:inactive_group) { create :group }
    let!(:regular_user) { create :user }

    describe "#administered_group" do
      it do
        expect(admin_user.administered_group).to eq active_group
      end
    end

    describe '#admin?' do
      it do
        expect(admin_user.admin?).to be true
      end

      it do
        expect(regular_user.admin?).to be false
      end
    end
  end
end
