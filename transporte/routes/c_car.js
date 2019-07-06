const express = require('express')
const router = express.Router();
const services = require('../services/s_car');
const Car = require('../models/m_car');

const car_services = new services();

/*GET Car List*/
router.get('/', (req, res, next) => {

});

/*Get Add a car */
router.get('/add', (req, res) => {
    if (services.create()) {
        res.redirect('index');
    } else {
        res.redirect('/');
    }
})

module.exports = router