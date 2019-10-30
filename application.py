from flask import Flask, request, send_file
from flask-mysql import MySQL

import Fractals
import os

application = Flask(__name__)



@application.route('/', methods=['GET'])
def do_GET():
        params = request.args
        if params['demo'] == 'fractal':
            angle = int(params['angle'])
            gif_path = '.' + os.sep + 'gifs' + os.sep + '{}.gif'.format(angle)
            try:
                return send_file(gif_path, mimetype='image/gif')
            except:
                Fractals.make_gif(angle)
                return send_file(gif_path, mimetype='image/gif')


if __name__ == '__main__':
    if not os.path.exists('gifs'):
        os.makedirs('gifs')
    application.run()