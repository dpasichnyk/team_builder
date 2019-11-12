require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  it_behaves_like 'model with a factory'

  let!(:active_questionnaire) { create me }
  let!(:inactive_questionnaires) { create_list me, 3, active: false }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:users) }
  end

  describe 'scopes' do
    describe '.active' do
      subject { described_class.active }

      it { is_expected.to eq [active_questionnaire] }
    end
  end

  describe 'class methods' do
    describe ".current" do
      it do
        expect(described_class.current).to eq active_questionnaire
      end
    end
  end
end
