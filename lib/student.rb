class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash) #{:name=>"Alex Patriquin", :location=>"New York, NY"}
    @name = student_hash[:name]
    @location = student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |name, location|
binding.pry
    end
    
                                                          #[{:name=>"Alex Patriquin", :location=>"New York, NY"},
                                                           # {:name=>"Bacon McRib", :location=>"Kansas City, MO"},
                                                           # {:name=>"Alisha McWilliams", :location=>"San Francisco, CA"},
                                                           # {:name=>"Daniel Fenjves", :location=>"Austin, TX"},
                                                           # {:name=>"Arielle Sullivan", :location=>"Chicago, IL"},
                                                           # {:name=>"Sushanth Bhaskarab", :location=>"Portland, OR"},
                                                           # {:name=>"Sushanth Bhaskarab", :location=>"Portland, OR"}]

  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

  end
end
