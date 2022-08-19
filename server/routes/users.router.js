const users = require('../controllers/users.controller')
const checkRoleMiddleware = require('../middlewares/checkRoleMiddleware')
const authMiddleware = require('../middlewares/authMiddleware')
const Router = require('express')
const router = new Router;

router.post('/registration', users.registration)
router.post('/login', users.login)
router.post('/auth', authMiddleware, users.check)
router.get('/', checkRoleMiddleware('ADMIN'), users.getAll)
router.get('/:id', users.getOne)
router.delete('/delete', users.delete)

module.exports = router