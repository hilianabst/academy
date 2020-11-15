class CreateJoinTableTrainingsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :trainings, :users do |t|
      t.references :training, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
