from flask import Flask, render_template, request, jsonify
import os

app = Flask(__name__)

# 1. ТОКЕНИ ХУДРО ДАР ИН ҶО ГУЗОРЕД (аз кабинети Travelpayouts)
API_TOKEN = "71876b59812fee6e1539f9365e6a12dd"

# 2. МАРКЕРИ ХУДРО ДАР ИН ҶО ГУЗОРЕД
MARKER = "701004"

@app.route('/')
def index():
    # Саҳифаи асосиро бо истифода аз Маркер бор мекунад
    return render_template('index.html', marker=MARKER)

# Ин қисм барои он лозим аст, ки агар шумо хоҳед маълумотро мустақиман аз API гиред
@app.route('/get_flights')
def get_flights():
    origin = request.args.get('origin')
    destination = request.args.get('destination')
    # Дар ин ҷо метавон дархости мустақим ба API-и Aviasales фиристод
    return jsonify({"status": "success", "message": "API is ready"})

if __name__ == '__main__':
    # Танзимот барои Render, ки портро ба таври автоматӣ пайдо мекунад
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
