import express, { Request, Response, NextFunction } from "express";
import path from "path";

// environment variables
const PORT = 8080;
const VERSION = "v1";
const AUTHOR = "bianbbc87";

// create an Express application
const app = express();

// ======================================== MiddleWare ========================================

// 추가: /api/v1/bianbbc87 하위에서도 정적 파일이 제공되도록 설정
app.use(`/api/${VERSION}/${AUTHOR}`, express.static(path.join(__dirname, "public")));

// ======================================== API ROUTES ========================================
/**
 * root method : /
 * Redirects to the health check endpoint.
 */
app.get("/", (req, res) => {
  res.redirect("/healthcheck");
});

/**
 * health check method : /healthcheck
 */
app.get(
  "/healthcheck",
  (req: Request, res: Response): void => {
    res.status(200).json({
      status: "UP",
      message: "The server is running.",
    });
  }
);

/**
 * get method : /api/v1/bianbbc87
 */
app.get(
  `/api/${VERSION}/${AUTHOR}`,
  (req: Request, res: Response): void => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
  }
);


// ======================================== Error Handling ========================================

app.use((err: any, req: Request, res: Response, next: NextFunction): void => {
  console.error(err.stack);
  res.status(500).json({ errorMessage: "Something broke!" });
});


// ======================================== Listeners ========================================

app.listen(PORT, (): void => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
