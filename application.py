from flask import Flask, request, send_file

import Fractals
import os

application = Flask(__name__)


@application.route('/', methods=['GET'])
def do_GET():
        params = request.args
        if params['demo'] == 'fractal':
            angle = int(params['angle'])
            gif_path = '{}.gif'.format(angle)
            try:
                return send_file(gif_path, mimetype='image/gif')
            except:
                gif_path = Fractals.make_gif(angle)
                return send_file(gif_path, mimetype='image/gif')


if __name__ == '__main__':
    if not os.path.exists('gifs'):
        os.makedirs('gifs')
    application.run()