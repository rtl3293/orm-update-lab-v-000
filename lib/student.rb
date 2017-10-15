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

  def self.new_from_db(row)
    self.new(row[0], row[1])

  def find_by_name(name)
    Stud
  end

  def self.create(name, grade)

    student = Student.new(name, grade)
    student.save
    student
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
      student =
    end
  end

end
