class Task < ActiveRecord::Base
  belongs_to :list
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :incomplete, where(:completed => nil)
end
