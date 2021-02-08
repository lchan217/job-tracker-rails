class Source < ApplicationRecord
    has_many :jobs

    scope :subtotal, -> { joins(:jobs).group(:name).count(:source_id) }
end