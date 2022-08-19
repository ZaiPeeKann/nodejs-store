const types = require('../controllers/types.controller')
const checkRoleMiddleware = require('../middlewares/checkRoleMiddleware')
const Router = require('express')
const router = new Router;

router.post('/', checkRoleMiddleware('ADMIN'), types.create)
router.get('/', types.getAll)
router.get('/:id', types.getOne)
router.delete('/', checkRoleMiddleware('ADMIN'), types.delete)

module.exports = router