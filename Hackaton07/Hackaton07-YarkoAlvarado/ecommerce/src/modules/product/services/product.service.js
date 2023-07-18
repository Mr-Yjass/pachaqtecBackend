const { response } = require("express");
const Product = require("../entity/product.entity");
const almacenService = require("../../almacen/services/almacen.service");

class PorductService {
  constructor() {}

  getListProduct(req, res) {
    res.json(almacenService.getLista);
  }

  crear(req, res) {
    const { name, price, description, stock } = req.body;
    const newProduct = new Product(name, price, description, stock);

    console.log(newProduct);
    almacenService.agregarAlmacen(newProduct.getInfo);

    res.json(newProduct.getInfo);
  }
}
const productService = new PorductService();

module.exports = productService;