import mysql from 'mysql';
import util from 'util';
import dotenv from 'dotenv';


dotenv.config();
const pool = mysql.createPool({
    connectionLimit: 10,
    // host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    socketPath:  process.env.DB_INSTANCE_NAME
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
    // if (connection) console.log("here");
    // connection.release();
    //return
});

pool.query = util.promisify(pool.query);

export default pool;