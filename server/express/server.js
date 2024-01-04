// crear un puerto unico, para cada metodo
// unir la carpeta del json

const express = require("express");
const fs = require("node:fs");

const app = express();

app.use(express.json());

app.disable("x-powered-by"); // no estamos mostrando informacion

const PORT = 3000;

app.get("/users", (req, res) => {
  fs.readFile('/json/user.json',"utf-8",(err,data) => { //solucion la direccion del json  
 
  if (err) console.error("tenemos un error intentando buscar el archivo");
  res.status(200).json(data);
}) 

});

app.listen(PORT, () => {
  console.log(`http://localhost:${PORT}/users`);
});
