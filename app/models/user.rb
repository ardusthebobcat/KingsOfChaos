class User < ActiveRecord::Base
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

  def upgrades(type, index)
    if (type == true)
      upgrades = [{ "'Mud' projectiles" => 250000},{"Fire-Arrows" => 500000}, {"Medium Rocks" => 1000000}, {"Catapults"=> 5000000}, {"Rapid-Fire Ballista"=> 10000000}, {"Hand of God"=>25000000}]
    else
      upgrades = [{ "Wooden Paliside" => 250000},{"Small Trench" => 500000}, {"" => 1000000}, {"Large Trench and Drawbridge"=> 5000000}, {"Massive Reinforced Walls"=> 10000000}, {"Impenetrable Walls"=>25000000}]
    end
    debugger;
    return upgrades[index]
  end

  def attack
    sum_attack = 1
    attack = (((self.trained * 2) * sum_attack) + ((self.untrained * 1) * sum_attack) * self.attack_level)
  end

  def increase_attack_level
    if self.total_gold > upgrades(true ,self.attack_level)
      self.total_gold = self.total_gold - upgrades(self.attack_level)
      self.attack_level = self.attack_level + 1
    end
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
