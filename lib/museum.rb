class Museum
  attr_reader :name,
              :exhibits,
              :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  # def recommend_exhibits(patron)
  #   recommended = patron.interests.each do |interest|
  #     @exhibits[0].name
  #   end
  #   recommended
  # end

  def admit(patron)
    @patrons << patron
  end

  # def patrons_by_exhibit_interest
  #   patrons_by_interest = {}
  #   patrons_by_interest[:exhibit] = @patron
  # end
end
