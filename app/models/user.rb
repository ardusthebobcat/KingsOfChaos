class User < ActiveRecord::Base
  has_many :items

  attr_accessor :password
  attr_accessor :army_size
  attr_accessor :gold_production
  attr_accessor :attack
  attr_accessor :defense
  attr_accessor :covert

  validates :username, :email, presence: true
  validates_confirmation_of :password

  before_save :encrypt_password

  def army_size
    army_size = self.untrained + self.trained + self.spy
  end

  def gold_production
    gold_production = self.untrained * 500
  end

  def attack
    sum_attack = 0
    self.items.each do |item|
      sum_attack = item.stat_sum
    end
    attack = (((self.trained * 2) * sum_attack) + ((self.untrained * 1) * sum_attack) * self.attack_level)
  end

  def defense
    defense = ((self.trained * 3) + (self.untrained * 1) * self.defense_level)
  end

  def covert
    covert = (self.spy * self.spy_level)
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
