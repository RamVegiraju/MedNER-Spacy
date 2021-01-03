from flask import Flask
import scispacy
import spacy
nlp = spacy.load("en_core_sci_sm")

inputText = '''
    I am coughing a lot. Feel a lot of chest pain and tremors. Other symptoms include difficulty breathing, runny nose"
'''
doc = nlp(inputText)
#print(doc.ents)

#Medical NER
app = Flask(__name__)
@app.route("/")
def example():
    return str(doc.ents)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port = int("5000"), debug=True)
