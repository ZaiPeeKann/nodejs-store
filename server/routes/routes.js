const users = require('./users.router')
const brands = require('./brands.router')
const types = require('./types.router')
const devices = require('./devices.router')
const Router = require('express')
const router = new Router

router.use('/users', users)
router.use('/brands', brands)
router.use('/types', types)
router.use('/devices', devices)

module.exports = router