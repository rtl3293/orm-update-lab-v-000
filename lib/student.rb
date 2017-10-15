require_relative "../config/environment.rb"
require 'pry'
class Student
  attr_accessor :name, :grade, :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER)
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE students
    SQL

    DB[:conn].execute(sql)
  end

  def find_by_name(name)

  end

  def self.create(name, grade)

    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?,?)
    SQL
    #binding.pry
    DB[:conn].execute(sql, name, grade)
    new_student = Student.new(name, grade)

    new_student.id = DB[:conn].execute(sql)

    sql = <<-SQL
      SELECT last_insert_rowid() FROM students
    SQL
    new_student.id = DB[:conn].execute(sql)[0][0]
    #@id = DB[:conn].execute(sql)[0][0]
  end
  def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?,?)
      SQL

      DB[:conn].execute(sql, @name, @grade)

      sql = <<-SQL
        SELECT last_insert_rowid() FROM students
      SQL

      @id = DB[:conn].execute(sql)[0][0]
    end

    def update

    end
  end

end
