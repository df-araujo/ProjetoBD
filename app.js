var express = require("express");
var app = express();
var path = require('path');
var mysql = require("mysql");

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "ProjetoBD"
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Conectado!");
});

app.set("view engine", "ejs");
app.use(express.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'public')));

app.get("/", function(req, res){
    var nome = "Loja de Cartas Pokémon TCG";

    var selectCartas = "SELECT * FROM Cartas";
    var selectClientes = "SELECT * FROM Clientes";
    var selectVendas = "SELECT * FROM Vendas";
    var selectCompras = "SELECT * FROM Compras";
    var selectTrocas = "SELECT * FROM Trocas";

    con.query(selectCartas, function (err, resultCartas) {
        if (err) throw err;
        con.query(selectClientes, function (err, resultClientes) {
            if (err) throw err;
            con.query(selectVendas, function (err, resultVendas) {
                if (err) throw err;
                con.query(selectCompras, function (err, resultCompras) {
                    if (err) throw err;
                    con.query(selectTrocas, function (err, resultTrocas) {
                        if (err) throw err;
                        res.render("index.ejs", {
                            nome: nome,
                            cartas: resultCartas,
                            clientes: resultClientes,
                            vendas: resultVendas,
                            compras: resultCompras,
                            trocas: resultTrocas
                        });
                    });
                });
            });
        });
    });
});

app.listen(3000, () => {
    console.log('SERVIDOR ATIVO, ACESSE http://localhost:3000');
});

app.post("/add-card", function(req, res) {
    var nome = req.body.nome;
    var tipo = req.body.tipo;
    var raridade = req.body.raridade;
    var expansao = req.body.expansao;
    var condicao = req.body.condicao;
    var precoCompra = req.body.precoCompra;
    var precoVenda = req.body.precoVenda;
    var quantidadeEstoque = req.body.quantidadeEstoque;

    var insert = `INSERT INTO Cartas (Nome, Tipo, Raridade, Expansao, Condicao, PrecoCompra, PrecoVenda, QuantidadeEstoque) 
                  VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

    con.query(insert, [nome, tipo, raridade, expansao, condicao, precoCompra, precoVenda, quantidadeEstoque], function (err, result) {
        if (err) throw err;
        console.log("1 carta inserida");
        res.redirect("/");
    });
});

