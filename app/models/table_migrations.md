CreateCourses table
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t| 
    	t.string :course_name							
    	t.references :department #foreign key reference to departments table
    	t.string :course_number 
    	t.string :professor
    	t.string :location
        t.string :day
    	t.datetime :time_start
    	t.datetime :time_end
    	t.text :summary
    	t.integer :paired_course_id
    	t.boolean :online
    end
  end
end


class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
    	t.string :department_name
    end
  end
end



class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
    	t.references :course
    	t.integer :linked_course_id
    end
  end
end

class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
    	t.references :course
    	t.references :user
    end
  end
end


class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
    	t.string :name
    	t.integer :cost
    	t.text :link
    end
  end
end




class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :courses, :materials do |t|
     	t.references :course
     	t.references :material
    end
  end
end




class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :student_name
    	t.string :username
    	t.integer :graduation_year
    	t.integer :major_id
    	t.integer :minor_id
    	t.string :password_digest
    end
  end
end

# (user.calendars = course they've taken)

