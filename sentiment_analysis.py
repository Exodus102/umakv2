from flask import Flask, request, jsonify
import tweetnlp

app = Flask(__name__)

# Load the TweetNLP model
model = tweetnlp.load_model('sentiment', multilingual=True)

@app.route('/analyze', methods=['POST'])
def analyze_sentiment():
    data = request.json
    user_input = data.get('text', '')
    if not user_input:
        return jsonify({'error': 'Text is required'}), 400

    result = model.sentiment(user_input)
    return jsonify({'sentiment_label': result['label']})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
