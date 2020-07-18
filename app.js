// Fetching the libraries
const express = require('express');
const port = process.port || 80;

let app = express();
app.use('/', express.static('/sap/ui5'));

// Starting the server
app.listen(port, () => {
    console.info(`UI5 SDK available at port ${port}`);
});