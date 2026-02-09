import os
from flask import Flask, render_template

app = Flask(__name__)

# --- МАРКЕР ВА ТОКЕНРО ТАНҲО ДАР ИН ҶО МОНЕД ---
MARKER = "701004" 
API_TOKEN = "71876b59812fee6e1539f9365e6a12dd"
# --------------------------------------------

@app.route('/')
def index():
    # Мо маркерро ба index.html мефиристем
    return render_template('index.html', marker=MARKER)

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
