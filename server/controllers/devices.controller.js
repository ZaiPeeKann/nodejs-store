const db = require('../database/db')
const path = require('path')
const uuid = require('uuid')

class DevicesController {
	async create(req, res) {
		const {name, price, brandId, typeId, info} = req.body;
		const {img} = req.files;
		let fileName = uuid.v4() + '.jpg'

		img.mv(path.resolve(__dirname, '../static', fileName))
		const data = await db.query(`insert into device (name, price, brand_id, type_id, img) 
		values ($1, $2, $3, $4, $5) RETURNING *`, [name, price, brandId, typeId, fileName]);

		if (info) {
			info = JSON.parse(info)
			info.forEach(i =>
				db.query(`insert into device_info (device_id, title, description) values ($1, $2, $3)`, [data.id, i.description, i.title])
			)
		}

		res.json(data.rows[0])
	}
	async getAll(req, res) {
		const {typeId, brandId, limit, page} = req.body

		if (!limit) limit = 'ALL';
		if (!page) page = 1;
		let offset = 0, data;
		if ((page > 1) || (limit != "ALL")) offset = limit * page - limit

		brandId && typeId ? data = await db.query(`select * from device where brand_id = $3 and type_id = $4 limit $1 offset $2`, [limit, offset, brandId, typeId]) :
		!brandId && typeId ? data = await db.query(`select * from device where type_id = $3 limit $1 offset $2`, [limit, offset, typeId]) :
		brandId && !typeId ? data = await db.query(`select * from device where brand_id = $3 limit $1 offset $2`, [limit, offset, brandId]) :
		data = await db.query(`select * from device limit $1 offset $2`, [limit, offset])

		res.json(data.rows)
	}
	async getOne(req, res) {
		const id = req.params.id;
		const device = await db.query(`select * from device where id = $1`, [id]);
		const info = await db.query(`select * from device_info where device_id = $1`, [id]);

		device.rows[0].info = info.rows
		res.json(device.rows[0])
	}
	async delete(req, res) {
		const {id} = req.body;
		const device = await db.query(`delete from device where id = $1 returning *`, [id]);
		db.query(`delete from device_info where device_id = $1`, [id])
		res.json(data.rows[0])
	}
}

module.exports = new DevicesController()