require 'rails_helper'

RSpec.describe GroupUsersService, type: :model do
  describe 'instance methods' do
    let(:instance) { described_class.new(users) }
    let(:users) { create_list :user, 25 }

    describe '#result' do
      subject { instance.result }

      it 'generally works' do
        expect { subject }.to change{ Group.count }.from(0)
        groups = Group.all
        expect(groups.map(&:users).flatten).to match_array(users)
        expect(users).to include(*groups.map(&:admin))
      end
    end
  end
end
