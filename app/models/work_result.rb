class WorkResult < ApplicationRecord
  belongs_to :time_card
  belongs_to :user
end
