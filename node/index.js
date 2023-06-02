var os = require('os')
const express = require('express')
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const app = express()
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const options = {
	definition: {
		openapi: "3.0.0",
		info: {
			title: "Demo Express API with Swagger",
			version: process.env.npm_package_version,
			description:
				"This is a simple CRUD API application made with Express and documented with Swagger. Original example from <https://blog.logrocket.com/documenting-express-js-api-swagger/>",
			license: {
				name: "MIT",
				url: "https://spdx.org/licenses/MIT.html",
			},
			contact: {
				name: "David Gallmeier",
				url: "https://ptcdevs.xounges.net",
				email: "ptcdevs@xounges.net",
			},
		},
		// servers: [
		// 	{
		// 		url: "http://localhost:3000",
		// 	},
		// ],
	},
	apis: ["./index.js"],
};
const swaggerSpec = swaggerJsdoc(options);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

/**
 * @openapi
 * /hello:
 *   get:
 *     description: Basic get method
 *     parameters:
 *      - name: name
 *        in: query
 *        description: your name
 *        required: true
 *        example: David G.
 *     responses:
 *       200:
 *         description: Returns a mysterious string.
 */
app.get('/hello', async function(req, res) {
	let name = req.query.name;
	res.send(`Hello, ${name}!`)
})

/**
 * @openapi
 * /hello:
 *   post:
 *     description: Basic post method
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 description: The user's name.
 *                 example: David G.
 *     responses:
 *       200:
 *         description: Returns a mysterious string.
 */
app.post('/hello', async function(req, res) {
	let name = req.body.name;
	res.send(`Hello, ${name}!`)
})

const port = 3000
app.listen(port, () => {
	console.log(`hostname: ${os.hostname()}`)
	console.log(`Example app listening on local ${port}`)
})