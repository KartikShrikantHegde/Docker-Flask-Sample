# third-party imports

from flask import Flask

# local imports
from config import app_config


def create_app(config_name):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_object(app_config[config_name])
    app.config.from_pyfile('config.py')

    # temporary route
    @app.route('/')
    def hello_world():
        return 'Hello !! Welcome to sample flask app using Docker.'

    return app
