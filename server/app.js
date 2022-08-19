const express = require("express");
const fileUpload = require('express-fileupload')
const router = require('./routes/routes')
const path = require('path')
require('dotenv').config();

const PORT = process.env.PORT || 5000
const app = express()

app.use(express.json())
app.use(express.static(path.resolve(__dirname, 'static')))
app.use(fileUpload({}))
app.use('/', router)
app.use((req, res, next) => {
	res.append('Access-Control-Allow-Origin', ['http://localhost:3000']);
	res.append('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
	res.append('Access-Control-Allow-Headers', 'Content-Type');
	next();
});

const start = async () => {
	app.listen(PORT, () => console.log('Server started on port:', PORT));
}

start().then(() => console.log('Success'), e => console.error('Failure! Error: ', e));