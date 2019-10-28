from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs

import Fractals
import os

class WebServer(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'image/gif')
        self.end_headers()
        params = parse_qs(urlparse(self.path).query)

        if params['demo'][0] == 'fractal':
            angle = params['angle'][0]
            gif_path = '.' + os.sep + 'gifs' + os.sep + '{}.gif'.format(angle)
            try:
                file = open(gif_path, 'rb')
            except:
                Fractals.make_gif(angle)
                file = open(gif_path, 'rb')
            self.wfile.write(file.read())
            self.wfile.close()
            file.close()


if __name__ == '__main__':
    try:
        server = HTTPServer(("localhost", 8000), WebServer)
        server.serve_forever()
    except KeyboardInterrupt:
        server.socket.close()
