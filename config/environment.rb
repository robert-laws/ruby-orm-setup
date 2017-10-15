require 'sqlite3'

DB = {:conn => SQLite3::Database.new("db/people.db")}
DB[:conn].execute("DROP TABLE IF EXISTS friends")

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS friends (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER
  )
SQL

DB[:conn].execute(sql)
# DB[:conn].results_as_hash = true