const express = require('express'),
router = express.Router();


router.get('/',(req, res)=>{

    if(req.session.loggedin){

        res.render('index.html',{
            login: true,
           
        });

        

    }else{

        res.render('portada.html',{

            login: false
        });

    }

});



router.get('/registrar', (req, res)=>{

    res.render('registrar.html')
});


router.get('/login', (req, res)=>{

    res.render('login.html')
});


router.get('/logout', (req, res)=>{

    req.session.destroy(()=>{
        res.redirect('/');
    })
});

module.exports = router;