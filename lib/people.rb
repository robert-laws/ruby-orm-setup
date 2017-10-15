class Friends
  attr_accessor :id, :name, :age

  def initialize(id = nil, name, age)
    @name = name
    @age = age
  end

  def save
    sql = "INSERT INTO friends (name, age) VALUES (?, ?)"
    DB[:conn].execute(sql, self.name, self.age)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM friends")[0][0]
  end
end

bob = Friends.new("Bob", 34)
bob.save

hal = Friends.new("Hal", 32)
hal.save

kal = Friends.new("Kal", 21)
kal.save

sql = "SELECT * FROM friends WHERE id = ?"
rows = DB[:conn].execute(sql, 1)
p rows