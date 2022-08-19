const brands = require('../controllers/brands.controller')
const checkRoleMiddleware = require('../middlewares/checkRoleMiddleware')
const Router = require('express')
const router = new Router;

router.post('/', checkRoleMiddleware('ADMIN'), brands.create)
router.get('/', brands.getAll)
router.get('/:id', brands.getOne)
router.delete('/', checkRoleMiddleware('ADMIN'), brands.delete)

module.exports = router