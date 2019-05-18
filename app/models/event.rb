class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validate :d_erreur
  validate :d_today

  def d_erreur
    if endDate < startDate
      errors.add(:endDate, '/ La date de fin doit être choisie après la date de début.')
    end
  end

  def d_today
    if startDate < Time.new
      errors.add(:startDate, '/ La date de début doit être au moins choisie après la date de d\'aujourd\'hui.')
    end
  end

end
