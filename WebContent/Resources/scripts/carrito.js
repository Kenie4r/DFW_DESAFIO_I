document.getElementById("ofertas").addEventListener("click", (e)=>{
    let tag = e.target; 
    if(tag.nameTag = "A" && tag.id.includes("cart")){
        e.preventDefault(); 
        let idCompra = tag.id.split("_")[1]; 
        let added = false; 
       // let localStorageCart = window.localStorage();  
        if(localStorage.getItem("carritoCupones")===null){
            let jsodCompra = {'producto1' : idCompra}
            localStorage.setItem("carritoCupones", JSON.stringify(jsodCompra))
        }else{
            let c = 1; 
            let jsodCompra = JSON.parse(localStorage.getItem("carritoCupones")); 
            for(const item in jsodCompra){
                c++; 
                if(jsodCompra[item] == idCompra){
                    added = true; 
                }
            }
            if(!added){
                jsodCompra["producto"+c] = idCompra; 
            }
            localStorage.setItem("carritoCupones", JSON.stringify(jsodCompra))


        }
        if(added){
   
            Swal.fire({
                title: 'Error', 
                text: 'Ya has seleccionado esta oferta anteriormente, para modificarla puede ir a ver tu carrito',
                icon: 'error', 
                showDenyButton: 'true', 
                confirmButtonText: 'Ver carrito',
                denyButtonText: 'Volver a ofertas'
               }).then((result)=>{
            	   if(result.isConfirmed){
            		   //pasar al carrito
            	   }
               })
        }else{
            Swal.fire({
                title: 'Agregado', 
                text: 'Se ha agrego la oferta a tu carrito',
                icon: 'success', 
                showDenyButton: 'true', 
                confirmButtonText: 'Ver carrito',
                denyButtonText: 'Volver a ofertas'
               }).then((result)=>{
            	   if(result.isConfirmed){
            		   //pasar al carrito
            	   }
               })
        }
    
    }
})