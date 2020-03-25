const express = require('express');
const oracledb = require('oracledb');
require('dotenv').config();

const app = express();

oracledb.getConnection({
    user: process.env.NODE_ORACLEDB_USER || "hr",
    password: process.env.NODE_ORACLEDB_PASSWORD,
    connectString: process.env.NODE_ORACLEDB_CONNECTIONSTRING || "localhost/orclpdb1",
}).then(connection => {
    //You can use the connection to acess your database
    console.log('connected to database');
    console.log('ENVIRONMENT:', process.env);
    app.get('/', (req, res) => {
        res.status(200).send({
            msg: "connected to database",
        });
    })
    //connection.execute()//call your commands
}).catch(err => {
    app.get('/', (req, res) => {
        res.status(200).send({
            msg: "falha na conexão com banco do servidor",
            err: err,
        });
    })
}).finally(() => {
    app.listen(3000, () => {
        console.log('listening to 3000');
    })
});



