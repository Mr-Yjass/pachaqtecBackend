const { response } = require("express");
const Carrito = require("../entity/carrito.entity");
const Product = require("../../product/entity/product.entity");
const almacen = require("../../almacen/entity/almacen.entity");

class CarritoService {
  constructor() {}

  getListProduct(req, res = response) {
    res.json(Carrito.getLista);
  }

  agregarCarrito(req, res) {
    const {nombre} = req.body;
    const newProduct = almacen.buscarProductos(nombre);
    console.log(newProduct);
    const { name, Precio, Modelo, Unidades } = newProduct[0];
    const newProduct2 = new Product(name, Precio, Modelo, Unidades);
    
    Carrito.agregarProductos(newProduct2.getInfo);

    res.json(newProduct2.getInfo);
  }
}
const carritoService = new CarritoService();

module.exports = carritoService;