class Event < ActiveRecord::Base
  validates :organizer_name, :title, :organizer_email, :date, presence: true
  # validates :title, presence: true
  # validates :organizer_email, presence: true
  # validates :date, presence: true
  validates_uniqueness_of :title
  validates_format_of :organizer_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validate :date_in_future

  def date_in_future
  	if self.date
  		errors.add(:date, "Cannot create an event in the past") if self.date < Date.today
  	end
  end
end
