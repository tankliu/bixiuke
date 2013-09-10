class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :score
      t.references :person
    end
    add_index :grades, :person_id
  end
end
