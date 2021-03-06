class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash) #{:name=>"Alex Patriquin", :location=>"New York, NY"}
    @name = student_hash[:name]
    @location = student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
    new_student = Student.new(student)
    end
  end

  def add_student_attributes(attributes_hash)
    new_student = Student.new(attributes_hash)
    attributes_hash.each do |key,value|
      # attributes_hash[key]= value
      # binding.pry
      self.send("#{key}=",value)
      # new_student[key] = value
    end
    attributes_hash
  end

  def self.all
    @@all
  end
end
