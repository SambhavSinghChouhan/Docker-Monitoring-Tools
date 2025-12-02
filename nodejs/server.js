const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, {"Content-Type": "text/plain"});
  res.end("Node.js service running\n");
});

server.listen(4000, () => {
  console.log("Node app running on port 4000");
});
