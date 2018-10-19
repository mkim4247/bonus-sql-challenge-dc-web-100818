# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.

require "sqlite3"
require 'csv'

db = SQLite3::Database.new 

rows = db.execute <<-SQL
  CREATE TABLE daily_show_guests (
    id INTEGER PRIMARY KEY
    name TEXT,
    date TEXT,
    occupation TEXT,
    data_category TEXT
  );
SQL

csv = <<CSV
"../daily_show_guests.csv"
CSV

CSV.parse(csv, headers: true) do |row|
  db.execute 
end

db.execute( )