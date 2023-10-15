# paninigram

## Goal
The goal of this project is to draw inspiration from the NYT's "Spelling Bee" game, but create a variation where the only goal is to find pangrams. As soon as all pangrams are found, a success animation is shown, and new letters will be displayed. I am making this project for fun and to practice Flutter. I also think that a cool variation of this project could be a birthday card where each set of letters (could be less than 7) has a pangram that when the words are combined, spells out a message. For example, 

- "HPAY" -> HAPPY
- "TRBIDHAY" -> BIRTHDAY
- "MO" -> MOM
- "EW" -> WE
- "OVLE" -> LOVE
- "OYU!" -> YOU!

## Project TODOs
1. Setup database/backend. I'm thinking textfile for convenience
    - in the short term, write Python script to do generate pangrams and save to file
2. Use a FutureProvider to load letters and pangrams from the file
3. Implement word check logic (AMBIENCE - yes! MACE - not a valid pangram) - add as function of answerProvider
4. Implement success animation on successful pangram
5. Implement screen reload when all pangrams are exhausted
6. Deploy app to the app store

