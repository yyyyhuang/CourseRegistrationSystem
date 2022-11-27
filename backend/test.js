import { createPool } from 'promise-mysql';

// createUnixSocketPool initializes a Unix socket connection pool for
// a Cloud SQL instance of MySQL.
const pool = await createPool({
    user: process.env.DB_USER, // e.g. 'my-db-user'
    password: process.env.DB_PASS, // e.g. 'my-db-password'
    database: process.env.DB_DATABASE, // e.g. 'my-database'
    socketPath: process.env.DB_INSTANCE_NAME, // e.g. '/cloudsql/project:region:instance'
    // Specify additional properties here.
  });


pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Database connection was closed.')
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Database has too many connections.')
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('Database connection was refused.')
        }
        console.log(err)
        return
    } 
    if (connection) console.log("here");
    // connection.release();
    //return
});




// [END cloud_sql_mysql_mysql_connect_unix]
export default pool;