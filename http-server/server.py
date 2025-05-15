from http.server import SimpleHTTPRequestHandler, HTTPServer

class CSVRequestHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        return super().do_GET()

if __name__ == "__main__":
    server = HTTPServer(('0.0.0.0', 8080), CSVRequestHandler)
    print("Serving on http://0.0.0.0:8080")
    server.serve_forever()
