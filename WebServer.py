from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs

import Fractals
import os

class WebServer(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        params = parse_qs(urlparse(self.url).query)

        if params['demo'] == 'fractal':
            angle = params['angle']
            gif_path = 'gifs' + os.sep + '{}.gif'.format(angle)
            try:
                file = open(gif_path, 'rb')
            except:
                Fractals.make_gif(angle)
                file = open(gif_path, 'rb')
            gif = file.read()
            file.close()
            self.wfile.write(gif)


if __name__ == '__main__':
    httpd = HTTPServer(("localhost", 8000), WebServer)
    httpd.serve_forever()
