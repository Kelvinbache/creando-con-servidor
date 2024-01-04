// crear un puerto unico, para cada metodo
// unir la carpeta del json

const express = require("express");

const fs = require("node:fs");

const path = require("node:path");

const { exec } = require("node:child_process");
const { stdout, stderr } = require("node:process");

const app = express();

app.use(express.json());

app.disable("x-powered-by"); // no estamos mostrando informacion

const PORT = 3000;

// direcciones del servidor 

app.get("/users", (req, res) => {
  
  const adress_of_pryect = path.parse(__dirname);
  const router_of_fileData = path.join(adress_of_pryect.dir,"json","user.json");

   fs.readFile(router_of_fileData, "utf-8", (err, data) => {
    if (err) console.error("tenemos un error buscando el archivo user.json");

    const dataParse = JSON.parse(data);
    res.status(200).json(dataParse);
  });
});


// activando el servidor 

app.listen(PORT, () => {
  adress_of_bash()
  console.log(`http://localhost:${PORT}/users`);
});
