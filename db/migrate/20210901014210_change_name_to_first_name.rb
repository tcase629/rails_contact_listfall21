class ChangeNameToFirstName < ActiveRecord::Migration[6.1]
  def change
    #             tablename  col    new col
    rename_column :contacts, :name, :first_name
  end
end
