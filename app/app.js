const express = require("express");
const app = express();

// Root endpoint
app.get("/", (req, res) => {
  res.type("text/plain").send("Hello from Kubernetes!");
});

// Health check endpoint for Kubernetes probes
app.get("/healthz", (_req, res) => {
  res.status(200).json({ status: "ok" });
});

// Generic error handler (professional touch)
app.use((err, _req, res, _next) => {
  console.error("Unexpected error:", err.stack);
  res.status(500).json({ error: "Internal Server Error" });
});

const port = process.env.PORT || 3000;
const server = app.listen(port, () => {
  console.log(`App running on port ${port}`);
});

// Graceful shutdown for Kubernetes
process.on("SIGTERM", () => {
  console.log("SIGTERM received. Shutting down gracefully...");
  server.close(() => {
    console.log("Closed out remaining connections.");
    process.exit(0);
  });
});
