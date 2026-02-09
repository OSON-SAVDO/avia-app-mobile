from flask import Flask, render_template, os

app = Flask(__name__)

# 1. ТОКЕНИ ХУДРО ДАР ИН ҶО ГУЗОРЕД
API_TOKEN = "71876b59812fee6e1539f9365e6a12dd"
# 2. МАРКЕРИ ХУДРО ДАР ИН ҶО ГУЗОРЕД
MARKER = "701004"

@app.route('/')
def index():
    return render_template('index.html', marker=MARKER)

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
