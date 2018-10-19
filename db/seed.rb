# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.

require "sqlite3"
require 'csv'

db = SQLite3::Database.new "../daily_show_guests.csv"

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
name,age
ben,12
sally,39
CSV

CSV.parse(csv, headers: true) do |row|
  db.execute "insert into users values ( ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
end

db.execute( "select * from users" ) # => [["ben", 12], ["sally", 39]]