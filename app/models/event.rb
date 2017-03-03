class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :body, :due_date
  before_create :set_complete

  def self.on_this_day(date)
    where('due_date BETWEEN ? AND ?', DateTime.strptime(date, "%F").beginning_of_day, DateTime.strptime(date, "%F").end_of_day).all
  end

  def set_complete
    self.completed = false
  end

  def start_time
    self.due_date
  end
end
