class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :cpf
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end

require 'csv'    

csv_text = File.read("dataset-pedidos.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Client.create!(row.to_hash)
end

puts csv