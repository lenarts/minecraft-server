import http from "http";
const port = process.env.PORT || 8080;
http.createServer((req, res) => {
  res.writeHead(200, {"Content-Type": "text/plain"});
  res.end("Minecraft server running!");

}).listen(port, () => console.log("Ping server active on port " + 25565));
