from http.server import SimpleHTTPRequestHandler, HTTPServer
import logging
import os
import sys

class CSVRequestHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        return super().do_GET()

def get_bool_env(name):
    v = os.environ.get(name)
    if v is None:
        return False
    return v.lower() in (1, 'true', 't')

if __name__ == "__main__":
    use_test_server = get_bool_env('USE_TEST_SERVER')
    if not use_test_server:
        sys.exit(0)
    server = HTTPServer(('0.0.0.0', 8080), CSVRequestHandler)
    logging.info("serving on http://0.0.0.0:8080")
    server.serve_forever()
