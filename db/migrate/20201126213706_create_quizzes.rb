class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :training, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
