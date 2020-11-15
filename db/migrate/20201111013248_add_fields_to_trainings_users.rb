class AddFieldsToTrainingsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings_users, :date_training, :datetime
    add_column :trainings_users, :state, :boolean
    add_column :trainings_users, :url_certificate, :string
  end
end
