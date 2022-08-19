const db = require('../database/db')

class BrandsController {
	async create(req, res) {
		const {name} = req.body;
		const data = await db.query(`insert into brand (name) values ($1) RETURNING *`, [name]);
		res.json(data.rows[0])
	}
	async getAll(req, res) {
		const data = await db.query(`select * from brand`);
		res.json(data.rows)
	}
	async getOne(req, res) {
		const {id, name} = req.body;
		const data = db.query(`select * from brand where id = $1 or name = $2`, [id, name]);
		res.json(data.rows[0])
	}
	async delete(req, res) {
		const {id, name} = req.body;
		const data = db.query(`delete from brand where id = $1 or name = $2 returning *`, [id, name]);
		res.json(data.rows[0])
	}
}

module.exports = new BrandsController()