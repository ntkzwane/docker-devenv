#!/usr/bin/env python

from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)

CORS(app)

@app.route('/', defaults={'path': ''}, methods=["GET", "PUT", "PATCH", "DELETE", "POST", "OPTIONS"])
@app.route('/<path:path>', methods=["GET", "PUT", "PATCH", "DELETE", "POST", "OPTIONS"])
def index(path):
    print ""
    print "path: %s\n" % path
    print "method: %s\n" % request.method
    print "headers:\n%s\n" % request.headers
    print "body:\n %s\n" % request.data
    print ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"

    return "%s" % path

if __name__ == "__main__":
    print '################### Starting server ###################'
    app.run(debug=True)

#!/usr/bin/env python

from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)

CORS(app)

@app.route('/', defaults={'path': ''}, methods=["GET", "PUT", "PATCH", "DELETE", "POST", "OPTIONS"])
@app.route('/<path:path>', methods=["GET", "PUT", "PATCH", "DELETE", "POST", "OPTIONS"])
def index(path):
    print ""
    print "path: %s\n" % path
    print "method: %s\n" % request.method
    print "headers:\n%s\n" % request.headers
    print "body:\n %s\n" % request.data
    print ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"

    return "%s" % path

if __name__ == "__main__":
    print '################### Starting server ###################'
    app.run(debug=True)
