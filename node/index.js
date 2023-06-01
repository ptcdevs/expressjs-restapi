var os = require('os')
const express = require('express')
const app = express()
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "Demo Express API with Swagger",
      version: "0.1.0",
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
    servers: [
      {
        url: "http://localhost:3000",
      },
    ],
  },
  apis: ["./index.js"],
};
const swaggerSpec = swaggerJsdoc(options);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

/**
 * @openapi
 * /:
 *   get:
 *     description: Welcome to swagger-jsdoc!
 *     responses:
 *       200:
 *         description: Returns a mysterious string.
 */
app.get('/', (req, res) => {
	res.send('Hello World!')
})

const port = 3000
app.listen(port, () => {
	console.log(`hostname: ${os.hostname()}`)
	console.log(`Example app listening on local ${port}`)
})