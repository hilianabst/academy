class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :description
      t.string :url_video

      t.timestamps
    end
  end
end
