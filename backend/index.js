import app from './server.js';
import dotenv from 'dotenv';


async function main() {
    dotenv.config();
    const port = process.env.PORT || 8000;

    app.listen(port, () => { //set server to listen at the port listen method is implemented in Express
        console.log('Server is running on port: ' + port);
    })
}
main().catch(console.error);