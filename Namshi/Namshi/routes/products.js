var express = require('express');
var router = express.Router();

var response  = require('./content/products.json');

var item = {};
item['id'] = 1;
item['sku'] = '12sxxsd223sdsd';
item['productName'] = 'Boots';
item['brandName'] = 'Timberland';
item['image'] = '';
item['price'] = 560.00;
item['productPage'] = 'https://en-ae.namshi.com/buy-timberland-splitrock-hiker-boots-for-men-casual-boots-89376.html';

/* GET home page. */
router.get('/', function(req, res) {
	var from = req.query.from;
	var count= req.query.count;
	var response = new Array()
	for(var  i = 0; i < count ; ++i){
		response[i] = item;
	}
   res.type('json');
   res.send(JSON.stringify(response));
});

module.exports = router;
