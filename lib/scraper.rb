require 'open-uri'
require 'pry'

class Scraper

  @@all = []

  attr_accessor :name, :location, :profile_url, :student_hash

  def initialize(student_hash)
    @student_hash = student_hash
    @@all << self 
    # use meta-programming to assign the newly created student attributes and values per the key/value pairs of the hash.
    student_hash.send("name=", )
    student_hash.send("location=", )
    student_hash.send("profile_url=", ) 
    # Use the #send method to 
    # achieve this. This method should also add the newly created student to the Student class' 
    # @@all array of all students. You'll need to create this class variable and set it equal to
    # an empty array at the top of your class. Push self into the array at the end of the 
    # #initialize method.

  end

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    doc.css(".main-wrapper").each do |element|
      student = Student.new
      student.name = element.css("h4").text
      student.location = element.css(".student-location").text
      student.profile_url = element.css(".student_card").text
      binding.pry
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# h4 class - student name
# p class="student-location" - location
# a href="students/ryan-johnson.html" - profile_url
