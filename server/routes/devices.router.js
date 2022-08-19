const devices = require('../controllers/devices.controller')
const checkRoleMiddleware = require('../middlewares/checkRoleMiddleware')
const Router = require('express')
const router = new Router;

router.post('/create', checkRoleMiddleware('ADMIN'), devices.create)
router.get('/',devices.getAll)
router.get('/:id', devices.getOne)
router.delete('/delete', checkRoleMiddleware('ADMIN'), devices.delete)

module.exports = router