const express = require("express");
const app = express();

const port = process.env.PORT || 8080;

// middleware
app.use(express.json());

/**
 * GET /
 * 서비스 웰컴 메시지 반환
 * curl 예시:
 *   curl http://localhost:8080/
 */
const getWelcome = (req, res) =>
  res.json({
    message: "Welcome to Puretension Web Service!",
    timestamp: new Date().toISOString(),
    status: "running",
  });

/**
 * GET /api/v1/puretension
 * 깃허브 계정 정보를 반환합니다.
 * curl http://localhost:30080/api/v1/puretension
 * response: {"github_account":"puretension","message":"Hello from Puretension API","version":"v1","timestamp":"2025-07-21T13:55:00.299Z"}
 */
const getGithubInfo = (req, res) =>
  res.json({
    github_account: "puretension",
    message: "Hello from Puretension API",
    version: "v1",
    timestamp: new Date().toISOString(),
  });

/**
 * GET /healthcheck
 * Health check를 수행합니다.
 * curl http://localhost:30080/healthcheck
 * response: {"status":"healthy","uptime":830.346580461,"timestamp":"2025-07-21T13:51:41.399Z","memory":{"rss":57864192,"heapTotal":8699904,"heapUsed":7384952,"external":1076290,"arrayBuffers":41162}}
 */
const getHealthCheck = (req, res) =>
  res.json({
    status: "healthy",
    uptime: process.uptime(),
    timestamp: new Date().toISOString(),
    memory: process.memoryUsage(),
  });

// route
app.get("/", getWelcome);
app.get("/api/v1/puretension", getGithubInfo);
app.get("/healthcheck", getHealthCheck);

// start server
app.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = app;
