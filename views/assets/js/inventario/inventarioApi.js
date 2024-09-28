import app from "../api.js"
import utilidades from "../utilidades.js"

const elemento = document.querySelector("codigoProducto");

document.addEventListener("submit",e =>{
    e.preventDefault();
    console.log(e.target.codigoProducto.value);
});



