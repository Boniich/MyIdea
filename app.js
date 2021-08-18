const express = require('express');
const app = express();
const index = require('./router/index');

app.use(express.urlencoded({extended:false}));
app.use(express.json());


const dotev = require('dotenv');

dotev.config({path:'./env/.env'});

// importamos la base de datos con las variables de entorno
const connection = require('./DB/db'); // definido despues de dotenv

app.use('/resources',express.static('public'));
app.use('/resources',express.static(__dirname + '/public'));




app.set('view engine', 'ejs'); // seteamos las plantillas de ejs

app.engine('html', require('ejs').renderFile); // me permite renderizar el html




//Registracion

const bcryptjs = require('bcryptjs');

const session = require('express-session');

app.use(session({

    secret: 'secret',
    resave: true,
    saveUninitialized: true

}));

app.post('/registrar', async(req, res)=>{

    const userName = req.body.user;

    const email = req.body.email;
    const confirmarEmail = req.body.confirmarEmail;


    const password = req.body.contrasena;
    const confirmarpassword = req.body.confirmarContrasena;

        if((userName!='') && (email!='') && (confirmarEmail!='') && (password!='') && (confirmarpassword!='')){

            if((email==confirmarEmail) && (password==confirmarpassword)){

                let passwordHaash = await bcryptjs.hash(password, 8);
                connection.query('INSERT INTO usuario SET ?',{usuario_nombre:userName, contrasena: passwordHaash, email: email},
            
                    async(error, result)=>{
            
                        if(error){
            
                            console.log(error);
                        }else{
            
                           res.render('registrar.html');
                        }
                    
            
                    });

            }

        
             if(email!=confirmarEmail){
        
            console.log('los email son distintos');
    
            }
    
            if(password!=confirmarpassword){
    
            console.log('Las contraseñas son distintas');
             }

    
         }
});


//login

app.post('/auth', async(req, res)=>{

    const user = req.body.user;
    const password = req.body.password;
    let passwordHaash = await bcryptjs.hash(password, 8);

    if(user && password){

        connection.query('SELECT * FROM usuario where usuario_nombre = ?', [user], async(error, result)=>{

            if(result.length == 0 || !(await bcryptjs.compare(password, result[0].contrasena))){

                console.log('Usuario y/o contraseña incorrecta');
            }else{
                
                req.session.loggedin = true;
                //investigar porque funciona con req.session.name y no con req.session.id
                req.session.name = result[0].id;
               

               // console.log(req.session.name);
                //necesitas renderizar hacia algun lugar, porque sino el programa se queda esperando hacia donde ir
                res.render('index.html');
                
               


            }

        });
    }else{

      console.log('ingrese usuario y/o constraseña');

    }

});






//guardar idea 

app.post('/guardar', async(req, res)=>{

    const titulo = req.body.titulo;
    const descripcion = req.body.descripcion;
    const id_usuario = req.session.name;

    connection.query('insert into guardar_idea set ?',{id_usuario:id_usuario, titulo:titulo, descripcion:descripcion},

        async(error, result)=>{

            if(error){

                console.log(error);
            }else{

                res.render('index.html');
                
              
            }
        }

    );

}); 

//router 
app.use('/',index);



// servidor
app.listen(3000, (req, res)=>{

    console.log('Funcionando en http://localhost:3000');
});
