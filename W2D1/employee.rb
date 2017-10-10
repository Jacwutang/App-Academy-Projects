class Employee

  attr_reader :name, :title, :boss, :salary, :bonus
  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @boss = boss
    @salary = salary
  end

  def bonus(multiplier)
    @bonus = (@salary)*  multiplier
  end

end



class Manager < Employee
  attr_reader :employees
  def initialize(name,title,salary,boss,employees)
    super(name,title,salary,boss)
    @employees = employees
  end

  def bonus(multiplier)

    total_salary = 0

    self.employees.each do |employee|
      total_salary += employee.salary
    end

    total_salary * multiplier
    end

end

Shawna = Employee.new("Shawna","TA",12000, "Darren")
David = Employee.new("David","TA",10000, "Darren")
Darren = Manager.new("Darren","TA manager",78000, "Ned",[Shawna,David])
Ned = Manager.new("Ned","Founder",100000,nil, [Darren,Shawna,David])

p Ned.bonus(5) #500k
p Darren.bonus(4) #88k
p David.bonus(3) #30k



#man = Manager.new("vince","swe",100,"kush", [])
#p a.name
#p man.name
