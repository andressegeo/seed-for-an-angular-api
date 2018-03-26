# -*- coding: utf-8 -*-
import uuid

import os
from flask import Flask
from routes import add_routes


class Server(object):
    def __init__(self):
        self.flask = Flask(__name__)
        self.flask.config.from_object(ServerConfiguration)
        add_routes(self.flask)

    def start(self, port):
        self.flask.run(port=port)

    def __call__(self, environ, start_response):
        return self.flask.wsgi_app(environ, start_response)


class ServerConfiguration(object):
    DEBUG = os.environ.get('env', 'dev') == 'dev'
    SECRET_KEY = uuid.uuid4()
