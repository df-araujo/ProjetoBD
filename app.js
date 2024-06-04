var express = require("express");
var path = require('path');
var app = express();
app.set("engine ejs", "ejs");
app.use(express.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'public')));
//rotas...
app.get("/", function(req, res){
    var nome ="Loja de Cartas Pokémon TCG";
    var mascots = [
        { nome: 'Sammy', empresa: "DigitalOcean", ano: 2012},
        { nome: 'Tux', empresa: "Linux", ano: 1996},
        { nome: 'Moby Dock', empresa: "Docker", ano: 2013}
    ];
    res.render("index.ejs", {
        nome: nome,
        mascots : mascots
    });
});
app.listen(3000, () => {
    console.log('SERVIDOR ATIVO, ACESSE http://localhost:3000');
});