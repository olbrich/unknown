require 'unknown'

class Patient
  attr_accessor :height
  attr_accessor :weight
  attr_accessor :name
  def initialize(_name, _height = Unknown, _weight = Unknown)
    @name = _name
    # It's pretty obvious from these initializers when they are Unknown and when they aren't
    @height = _height || Unknown
    @weight = _weight || Unknown
    # if height & weight are required then throw an exception
    # fail ArgumentError, 'height is required' if _height.unknown?
  end

  # No nil checks for height and weight, just the relevant formula
  def bmi
    ( weight.to_f / ( (height.to_f)**2 ) ) * 703.0
  end

  # No nil checks for height and weight, just the relevant formula
  def bsa
    Math.sqrt( height.to_f * weight.to_f / 3131.0 )
  end
end

class PatientWithDefaults < Patient
  def initialize(_name, _height = Unknown, _weight = Unknown)
    @name = _name
    @height = _height.if_unknown? { 72 }
    @weight = _weight.if_unknown? { 200 }
  end
end

# Data
patients = [
  Patient.new('Bob', 72, 200),
  Patient.new('Tom', 65, Unknown),
  Patient.new('Sam', Unknown, 225),
  Patient.new('Jim', Unknown, Unknown),
  PatientWithDefaults.new('Terry')
]

# Presentation
# Note that it is not necessary to do any nil checking in the output.
puts
puts "Name           Height (in)    Weight (lbs)   BMI            BSA"
puts "==============================================================================="
patients.each do |patient|
  puts [
    "#{patient.name}",
    "#{patient.height}",
    "#{patient.weight}",
    "#{patient.bmi.if_known? {|x| sprintf('%0.2f', x)}}",
    "#{patient.bsa.if_known? {|x| sprintf('%0.2f', x)}}"
  ].map { |x| x.ljust(15) }.join
end
