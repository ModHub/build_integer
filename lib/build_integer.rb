require "build_integer/version"

module BuildInteger
  BUILD_NUMBER_FILE_NAME = ".build-number"
  @@current_build_number = 0

  def self.find
    read_or_create
    @@current_build_number
  end

  def self.current
    @@current_build_number
  end

  def self.increment
    @@current_build_number += 1
    write_file
    @@current_build_number
  end

  def self.decrement
    @@current_build_number -= 1
    write_file
    @@current_build_number
  end

  def self.set_build_number(build_number)
    @@current_build_number = build_number
    write_file
    @@current_build_number
  end

  def self.reset
    @@current_build_number = 0
    write_file
    @@current_build_number
  end

private
  def self.read_or_create
    if File.exists?(BUILD_NUMBER_FILE_NAME)
      @@current_build_number = File.read(BUILD_NUMBER_FILE_NAME).to_i
    else
      write_file
    end
  end

  def self.write_file
    File.write BUILD_NUMBER_FILE_NAME, @@current_build_number.to_s
  end

end
