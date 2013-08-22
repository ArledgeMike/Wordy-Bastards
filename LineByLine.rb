class  LineByLine

  attr_accessor :fName, :file_open, :file_read, :word_hash, :file_array

  def initialize
    @word_hash = Hash.new(0)
    50.times { print "*"}
    print "Welcome To The Line Reader \nEnter The Name Of A Text File To Read\n>"
    @fName = gets.chomp  
    puts "Computing.............."
    @file_open = File.open(fName, "r+")
    @file_read = file_open.read
   # File.truncate(@fName,0 ) 
    compile_hash  
  end

  def compile_hash
    @file_array = @file_read.downcase.split(" ")
    @file_array.each { |x| 
      word = x.gsub(/[^A-Za-z_\s+]/, "")
 
    @word_hash[word] += 1
     } 
    write_to_file
  end

  def write_to_file
    @fName = @fName.gsub!(/.txt/, "")
    new_file = File.new("#{@fName}_words.txt", File::CREAT|File::TRUNC|File::RDWR, 0644)
    @word_hash =  @word_hash.sort_by { |a,b| a}
    @word_hash.each { |x,y| 
      new_file.write( "#{x} : #{y}\n")
    }
    50.times { puts "*"}
    puts "Finished Computing..........." 
  end

end

m = LineByLine.new

