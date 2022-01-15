from flask import Flask, render_template, request
from flask_cors import CORS
import subprocess

# init flask and cors middleware
app = Flask(__name__)
CORS(app)

@app.route("/")
def index():
    cmd = subprocess.check_output("scasp --tree --human main.pl", shell=True)
    print(cmd)
    return render_template('index.html', text=cmd.decode("utf-8"))

@app.route("/db", methods=["POST"])
def db():
    """
    This method adds data to the database
    """
    data = request.get_data()

    with open("db.pl", "ab") as f:
        f.write(data)
        f.close()

    print(data)
    return "yay"
