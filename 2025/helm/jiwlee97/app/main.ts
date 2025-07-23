import express from 'express';

const app = express();
const port = process.env.PORT || 8080;

app.get('/api/v1/jiwlee97', (req, res) => {
  res.send('Hello from jiwlee97!');
});

app.get('/healthcheck', (req, res) => {
  res.send('OK');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
