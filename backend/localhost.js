import mysql from 'mysql';
import util from 'util';
import dotenv from 'dotenv';


dotenv.config();
const local = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    database: 'test',
    user: 'root',
    password: 'Fighting1928.',
    // socketPath:  process.env.DB_INSTANCE_NAME
});

local.getConnection((err, connection) => {
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

local.query = util.promisify(pool.query);

export default local;