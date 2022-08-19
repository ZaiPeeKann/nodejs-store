const jwt = require('jsonwebtoken')

module.exports = (req, res, next) => {
	if (req.method === "OPTIONS") next();

	try {
		const token = req.headers.authorization.split(' ')[1];
		if (!token) res.status(401).json({"Error": "Вы не авторизованы"})
		req.user = jwt.verify(token, process.env.JWT_SECRET_KEY)
		console.log(req.user)
		next()

	} catch (e) {
		console.log(e)
		res.status(401).json({"Error": "Вы не авторизованы"})
	}
}