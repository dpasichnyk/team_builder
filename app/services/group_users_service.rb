class GroupUsersService

  # @return [Users]
  attr_reader :users

  # @return [void]
  def initialize(users)
    raise StandardError, 'Users array is blank' if users.blank?

    @users = users
  end

  # @return [Array]
  def result
    created_groups
  end

  private

  # @raise [ActiveRecord::RecordInvalid]
  # @return [Array]
  def created_groups
    @created_groups ||= begin
      Group.transaction do
        grouped_users.map do |users|
          Group.create!(users: users, admin: users.sample)
        end
      end
    end
  end

  # @return [Array]
  def grouped_users
    group_size = users.count / groups_count
    leftovers = users.count % groups_count

    groups = []
    start = 0

    groups_count.times do |index|
      length = group_size + (leftovers > 0 && leftovers > index ? 1 : 0)
      groups << users.slice(start, length)
      start += length
    end

    groups
  end

  # @return [Integer] We want to control group count/size with this coefficient.
  def capacity_coefficient
    @capacity_coefficient ||= (8..14).to_a.sample
  end

  # @return [Float]
  def groups_count
    @groups_count ||= (users.count.to_f / capacity_coefficient).ceil
  end
end