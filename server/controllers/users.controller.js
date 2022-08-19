const db = require('../database/db')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

class UsersController {
	async registration(req, res) {
		try {
			const {nickname, email, password} = req.body;
			if (!password || !nickname || !email) return res.status(400).json({"Error": "Заполните все обязательные поля"})
			const role = "USER"
			const candidate = await db.query(`select * from person where email = $1`, [email])
			if (candidate.rows[0]) return res.status(400).json({"Error": "Пользователь с таким email уже зарегестрирован"})

			const hashPassword = bcrypt.hash(password, 3)
			const user = await db.query(`insert into person (nickname, email, password, role) values ($1, $2, $3, $4)
                                   returning *`, [nickname, email, hashPassword, role]);
			await db.query(`insert into basket (person_id) values ($1)`, [user.rows[0].id])

			const token = jwt.sign({id: user.id, email, role}, process.env.JWT_SECRET_KEY, {expiresIn: "24h"})

			return res.json({token})
		}	catch (e) {
			console.log(e)
			res.status(500).json({"Error": "Что-то пошло не так"})
		}
	}

	async login(req, res) {
		const {email, password} = req.body;
		if (!email || !password) res.status(400).json({"Error": "Введите email и пароль"})
		const candidate = await db.query(`select * from person where email = $1`, [email]);

		if (!candidate.rows[0]) res.status(400).json({"Error": "Пользователя с таким email не существует"})
		if (password != candidate.rows[0].password) res.status(400).json({"Error": "Неправильный пароль"})

		const token = jwt.sign({id: candidate.rows[0].id, email, role: candidate.rows[0].role}, process.env.JWT_SECRET_KEY, {expiresIn: "24h"})
		res.json({token})
	}

	async check(req, res) {
		const token = jwt.sign({id: req.user.id, email: req.user.email, role: req.user.role}, process.env.JWT_SECRET_KEY, {expiresIn: "24h"});
		res.json({token})
	}

	async getAll(req, res) {
		const data = await db.query(`select * from person`);
		res.json(data.rows)
	}

	async getOne(req, res) {
		try {
			const {id} = req.body;
			const data = db.query(`select * from person where id = $1`, [id]);
			res.json(data.rows[0])
		} catch (e) {
			res.status(400).json({"Error": "Пользователь не найден"})
		}
	}
	async delete(req, res) {
		try {
			const {id} = req.body;
			const data = await db.query(`delete from person where id > $1 returning *`, [id]);
			res.json(data.rows[0])
		}	catch (e) {
			console.log(e)
			return res.status(400).json({"Error": "Пользователь не найден"})
		}
	}
}

module.exports = new UsersController()