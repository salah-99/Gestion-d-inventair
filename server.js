const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')
const path = require('path')
const app = express()


app.use(express.static(path.join(__dirname, 'images')))


app.use(bodyParser.urlencoded({extended: true}))
app.set('view engine', 'ejs')


const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "database"
});

con.connect(function(error){
    if(!!error) console.log(error);
    else console.log('Database is Connected');
}); 

const siteTitle = 'Stock Management'
const baseURL = 'http://localhost:3000/'


// /////////////////////////    RAYON      / /////////////////
// Get the shelves product
app.get('/',(req, res) => {
    let sql = "SELECT * FROM rayon";
    let query = con.query(sql, (err, result) => {
        if(err) throw err;
        res.render('rayon', {
            siteTitle : siteTitle,
            pageTitle : 'Stock Management',
            items : result
        });
    });
});

// ADD new rayon

app.get('/rayon/add',(req, res) => {
    res.render('add-rayon', {
        siteTitle : siteTitle,
        pageTitle : 'Add new rayon',
        items : ''
    });
});
   
app.post('/rayon/add',(req, res) => { 
    let data = {name: req.body.name, img: req.body.img};
    let sql = "INSERT INTO rayon SET ?";
    let query = con.query(sql, data,(err, results) => {
      if(err) throw err;
      res.redirect(baseURL);
    });
});


// update some data

app.get('/rayon/edit/:id',(req, res) => {

    const authorId = req.params.id;
    let sql = `Select * from rayon where id_R = ${authorId}`;
    let query = con.query(sql,(err, result) => {
        if(err) throw err;
        res.render('edit-rayon', {
            siteTitle : siteTitle,
            pageTitle : "Editing Rayon : " + result[0].name,
            item : result
        });
    });
});

app.post('/rayon/edit/:id',(req, res) => {
  
    let userId = req.body.id_R
      let sql = "update rayon SET name='"+req.body.name+"', img='"+req.body.img+"' where id_R ="+userId;
      let query = con.query(sql,(err, results) => {
        if(err) throw err;
        res.redirect(baseURL);
      });
  });


//  Delete some data
app.get('/rayon/delete/:id', (req, res) => {
    const userId = req.params.id;
    let sql = `DELETE from rayon where id_R = ${userId}`;
    let query = con.query(sql,(err, result) => {
        if(err) throw err;
        res.redirect(baseURL);
    });
});

/////////////////////////////////      PRODUIT     ///////////////////////////////////////////////

const siteTitl = 'Product'

// Get the product
app.get('/produit/:id',(req, res) => {
    id = req.params.id;
    let sql = "SELECT produit.id_P, produit.name_p, produit.category, produit.price, produit.quantité, rayon.id_R, rayon.name FROM produit INNER JOIN rayon ON produit.id_R = rayon.id_R AND produit.id_R = '" +id+ "' ";
    let query = con.query(sql, (err, result) => {
        if(err) throw err;
        res.render('produit', {
            siteTitl : siteTitl,
            pageTitle : 'Product: ',
            items : result
        });
    });
});

// ADD new product

app.get('/add',(req, res) => {
    res.render('add-produit', {
        siteTitl : siteTitl,
        pageTitle : 'Add new Product :',
        items : ''
    });
});
   
app.post('/add',(req, res) => { 
    let data = {name_p: req.body.name_p, category: req.body.category, price: req.body.price, quantité: req.body.quantité, id_R: req.body.id_R};
    let sql = "INSERT INTO produit SET ?";
    let query = con.query(sql, data,(err, results) => {
      if(err) throw err;
      res.redirect(baseURL);
    });
});


// update some data

app.get('/edit/:id',(req, res) => {

    const authorId = req.params.id;
    let sql = `Select * from produit where id_P = ${authorId}`;
    let query = con.query(sql,(err, result) => {
        if(err) throw err;
        res.render('edit-produit', {
            siteTitl : siteTitl,
            pageTitle : "Editing Product: " ,
            item : result
        });
    });
});

app.post('/edit/:id',(req, res) => {
  
    let userId = req.body.id_P
      let sql = `UPDATE produit SET name_p='${req.body.name_p}', category='${req.body.category}', price='${req.body.price}', quantité='${req.body.quantité}', id_R='${req.body.id_R}' WHERE id_P =${userId}`;
      let query = con.query(sql,(err, results) => {
        if(err) throw err;
        res.redirect(baseURL);
      });
  });


//  Delete some data
app.get('/delete/:id', (req, res) => {
    const userId = req.params.id;
    let sql = `DELETE from produit where id_P = ${userId}`;
    let query = con.query(sql,(err, result) => {
        if(err) throw err;
        res.redirect(baseURL);
    });
});

/////////////////////////////////       Fornisseur      ///////////////////////////////////////////////

const siteTitlle = 'Provider'

// Get the fornisseur
app.get('/fornisseur/:id',(req, res) => {
    id = req.params.id;
    let sql = "SELECT fornisseur.id_P, fornisseur.name, fornisseur.address, fornisseur.télé, fornisseur.email, produit.id_P, produit.name_p FROM fornisseur INNER JOIN produit ON fornisseur.id_P = produit.id_P AND fornisseur.id_P = '" +id+ "' ";
    let query = con.query(sql, (err, result) => {
        if(err) throw err;
        res.render('fornisseur', {
            siteTitlle : siteTitlle,
            pageTitle : 'Provider',
            items : result
        });
    });
});

// ADD new fornisseur

app.get('/add/fornisseur',(req, res) => {
    res.render('add-fornisseur', {
        siteTitlle : siteTitlle,
        pageTitle : 'Add Provider ',
        items : ''
    });
});
   
app.post('/add/fornisseur',(req, res) => { 
    let data = {name: req.body.name, address: req.body.address, télé: req.body.télé, email: req.body.email, id_P: req.body.id_P};
    let sql = "INSERT INTO fornisseur SET ?";
    let query = con.query(sql, data,(err, results) => {
      if(err) throw err;
      res.redirect(baseURL);
    });
});


//  Delete some data
app.get('/delete-fornisseur', (req, res) => {
    let sql = `DELETE from fornisseur`;
    let query = con.query(sql,(err, result) => {
        if(err) throw err;
        res.redirect(baseURL);
    });
});

app.listen(3000,function(){
    console.log('Server is running at port 3000')
})