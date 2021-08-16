
        function cambiarModo(){

            let cuerpo = document.body;
            cuerpo.classList.toggle("dark-mode");

            let nav = document.querySelector(".barra-navegacion");
            nav.classList.toggle("dark-mode-nav");

            let titulos = document.querySelectorAll(".titulo");
            titulos.forEach(titulo => titulo.classList.toggle("dark-mode-titulo"));

            let box = document.querySelector(".box");
            box.classList.toggle("dark-mode-cajas"); 

            let mostrar = document.querySelector(".mostrar");
            if(mostrar!=null){mostrar.classList.toggle("dark-mode-cajas");}

            let botones = document.querySelectorAll(".btn-general");
            botones.forEach(boton => boton.classList.toggle("dark-mode-btn-general"));

            let entradas = document.querySelectorAll(".entrada-info");
            entradas.forEach(entrada => entrada.classList.toggle("dark-mode-entrada-info"));

            let login = document.querySelector(".estilo-login");
            if(login!=null){login.classList.toggle('dark-mode-estilo-login');}

        }