const mysql = require('mysql');

const connection = mysql.createConnection({

    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE

});

connection.connect((error)=>{

    if(error){

        console.log('EL error de la conexion a la base de datos es: '+error);  
        return; 
    }

    console.log('conexion exitosa');

});

module.exports = connection;