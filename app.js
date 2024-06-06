var express = require("express");
var app = express();

var path = require('path');

var mysql = require("mysql");
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "ProjetoBD"
})
con.connect(function(err) {
    if (err) throw err;
    console.log("Conectado!");
});
app.set("engine ejs", "ejs");
app.use(express.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'public')));

//rotas...
app.get("/", function(req, res){
    /*
    */
    select = "SELECT * FROM Cartas";    
    insert = "INSERT INTO Cartas(Nome, Tipo, Raridade, Expansao, Condicao, PrecoCompra, PrecoVenda, QuantidadeEstoque)" +
            "VALUES ('Nome', 'Tipo', 'Raridade', 'Expansao', 'Condicao', 1.0, 1.0, 1)";
    var nome = "Loja de Cartas Pokémon TCG";
    con.query(select, function (err, result, fields) {
        if (err) throw err;
        res.render("index.ejs", {
            nome : nome,
            con : con,
            result : result
        });
    });
});
app.listen(3000, () => {
    console.log('SERVIDOR ATIVO, ACESSE http://localhost:3000');
});