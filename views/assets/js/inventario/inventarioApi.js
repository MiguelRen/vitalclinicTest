import app from "../api.js"
import utilidades from "../utilidades.js"


const extraer_datos_productos = async (data)=>{
    const resultados = await app()
};



document.addEventListener("submit",e =>{
    e.preventDefault();
    const codProducto = e.target.codigoProducto.value;
});    


    
