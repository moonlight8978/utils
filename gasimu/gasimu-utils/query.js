const sqlite3 = require('sqlite3').verbose()
const path = require('path')
const fs = require('fs')

const DB_PATH = path.join(
  __dirname,
  'assets',
  '7d2bdcfa272ce3dadad2c2094b496a0ab1176aeb'
)

let db = new sqlite3.Database(DB_PATH, (err) => {
  if (err) {
    console.error(err.message)
  }
  console.log('Connected to the database.')
})

const sql = `
  SELECT    unit_id, unit_name, rarity
  FROM      unit_data
  WHERE     unit_id < ?
  ORDER BY  rarity
`
const params = [110000]

db.all(sql, params, (err, rows) => {
  if (err) {
    console.error(err.message)
  }

  const serializedData = JSON.stringify(rows, null, 4)
  fs.writeFileSync("data.json", serializedData)
})

db.close((err) => {
  if (err) {
    console.error(err.message)
  }
  console.log('Close the database connection.')
})