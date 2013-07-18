class Event < ActiveRecord::Base
  validates :organizer_name, :title, :organizer_email, presence: true
  validates_uniqueness_of :title
  validates_format_of :organizer_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
end
