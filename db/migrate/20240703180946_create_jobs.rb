class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|

      t.timestamps
    end
  end
end
