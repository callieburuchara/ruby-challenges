class School
  def initialize
    @students = {}
  end

  def to_h
    @students
  end

  def add(name, age)
    if @students.keys.include?(age)
      (@students[age] << name).sort!
    else
      @students[age] = [name]
      @students = @students.sort.to_h
    end
  end

  def grade(grade)
    @students[grade] || []
  end

end
