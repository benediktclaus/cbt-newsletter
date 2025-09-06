#import "@local/cbt-newsletter:0.1.0": *

#show: newsletter.with(
  date: [September 2025],
  welcome: [Hallo zur neuen Ausgabe von _CBT & Psychotherapy Insights_.],
  intro: [
    #lorem(120)
  ],
)


#new-heading(
  "Das Neueste aus der KVT",
  "",
)


#pico(
  population: [],
  intervention: [],
  comparison: [],
  outcome: [],
)


#new-heading(
  "Das Neueste aus der Psychotherapie",
  "",
)


#new-heading(
  "Aktuelle Studie mit Impact",
  "Therapeutisches Abdriften in der Supervision: Wie wir auf Kurs bleiben",
)


#new-heading(
  "Klassiker des Monats",
  "",
)


#new-heading(
  "Kuriosität des Monats",
  "Wo die Neugier im Gehirn entsteht: Ein Blick ins neugierige Gehirn",
)


#new-heading(
  "Klinische Frage des Monats",
  "Zeit zu denken",
)


#new-heading(
  "Tipp zur Selbstfürsorge für Therapeuten",
  "Selbst aktiv werden",
)


#new-heading(
  "Person des Monats",
  "Wem wir diesen Monat huldigen",
)


#person-of-the-month(
  name: [],
  picture: [], //should be an image with height set to 100%
  quote: [],
)
