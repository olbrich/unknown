class Patient
  attr_accessor :height
  attr_accessor :weight
  attr_accessor :name
  def initialize(_name, _height, _weight)
    @name = _name
    @height = _height
    @weight = _weight
    # this might also raise an exception if height or weight were required
    # fail ArgumentError, 'height is required' unless height
  end

  # Note the need for nil checks in the event that the height or weight is unknown
  def bmi
    return unless height && weight
    ( weight.to_f / ( (height.to_f)**2 ) ) * 703.0
  end

  # Note the need for nil checks in the event that the height or weight is unknown
  def bsa
    return unless height && weight
    Math.sqrt( height.to_f * weight.to_f / 3131.0 )
  end
end

class PatientWithDefaults < Patient
  def initialize(_name, _height = nil, _weight = nil)
    @name = _name
    @height = _height || 72
    @weight = _weight || 200
  end
end

# Presentation
# nils in the initializers for unknown values.  A common convention, but
# not as intention revealing as it could be
patients = [
  Patient.new('Bob', 72, 200),
  Patient.new('Tom', 65, nil),
  Patient.new('Sam', nil, 225),
  Patient.new('Jim', nil, nil),
  PatientWithDefaults.new('Terry')
]

# Note the need for nil checks here to handle cases where values are unknown
puts
puts "Name           Height (in)    Weight (lbs)   BMI            BSA"
puts "==============================================================================="
patients.each do |patient|
  puts [
    "#{patient.name}",
    "#{patient.height || "Unknown" }",
    "#{patient.weight || "Unknown" }",
    "#{ patient.bmi ? sprintf('%0.2f',patient.bmi) : "Unknown" }",
    "#{ patient.bsa ? sprintf('%0.2f',patient.bsa) : "Unknown" }"
  ].map { |x| x.ljust(15) }.join
end
