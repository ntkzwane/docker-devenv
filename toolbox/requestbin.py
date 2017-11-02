from flask import Flask, request
from flask.ext.cors import CORS
app = Flask(__name__)
CORS(app)
@app.route('/', defaults={'path': ''}, methods=["GET", "POST", "OPTIONS"])
@app.route('/<path:path>', methods=["GET", "POST", "OPTIONS"])
def hello(path):
    print ""
    print "path: %s\n" % path
    print "method: %s\n" % request.method
    print "headers:\n%s\n" % request.headers
    print "body:\n %s\n" % request.data
    print ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"

    return "%s" % path

if __name__ == "__main__":
    app.run(debug=True)
