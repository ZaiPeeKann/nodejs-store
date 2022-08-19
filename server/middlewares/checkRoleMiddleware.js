const jwt = require('jsonwebtoken')

module.exports = (role) => {
	return (req, res, next) => {
		if (req.method === "OPTIONS") next();

		try {
			const token = req.headers.authorization.split(' ')[1];
			if (!token) res.status(401).json({"Error": "Вы не авторизованы"})
			req.user = jwt.verify(token, process.env.JWT_SECRET_KEY)
			if (role !== req.user.role) return res.status(403).json({"Error": "Нет доступа"})
			next()
		} catch (e) {
			res.status(403).json({"Error": "Вы не авторизованы"})
		}
	}
}