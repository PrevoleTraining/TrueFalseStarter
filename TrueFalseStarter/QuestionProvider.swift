//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 05.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

import GameKit

///
/// The question provider class manage the question collection and
/// offer facilitators to choose a question randomly avoiding
/// duplicate questions
///
class QuestionProvider {
    /*
     * The list of questions
     * Set between two and four answer choices
     * Source for the questions: http://brainfall.com/quizzes/only-3-can-pass-this-star-wars-quiz-can-you
     */
    let questions: [Question] = [
        Question(
            label: "Denis Lawson, who played Wedge Antilles, is which other Star Wars actor's uncle?",
            answerChoices: ["Harrison Ford", "Hayden Christensen", "Ewan McGregor" ],
            validAnswer: 2
        ),
        Question(
            label: "Which of the following Star Wars films did George Lucas NOT direct?",
            answerChoices: ["Ep IV - A New Hope", "Ep VI - Return of the Jedi", "Ep I - The Phantom Menace"],
            validAnswer: 1
        ),
        Question(
            label: "Which Star Wars actor was nominated for an Academy Award?",
            answerChoices: ["Harrison Ford", "Alec Guinness", "John Ratzenberger", "Carrie Fisher"],
            validAnswer: 1
        ),
        Question(
            label: "Which rapper auditioned for the role of Mace Windu (but was beat out by Samuel L. Jackson)?",
            answerChoices: ["Dr. Dre", "Snoop Dogg", "Tupac Shakur"],
            validAnswer: 2
        ),
        Question(
            label: "How many parsecs did the Millennium Falcon make the Kessel Run in?",
            answerChoices: ["< 12 parsecs", "< 14 parsecs", "< 20 parsecs", "<42 parsecs"],
            validAnswer: 0
        ),
        Question(
            label: "What planet did the Empire use the Death Star to destroy?",
            answerChoices: ["Hoth", "Alderaan", "Dagobah", "Tatooine"],
            validAnswer: 1
        ),
        Question(
            label: "Who was Princess Leia's only hope?",
            answerChoices: ["Emperor Palpatine", "Obi Wan Kenobi", "Yoda"],
            validAnswer: 1
        ),
        Question(
            label: "Which of the following characters did NOT say the line, 'I have a bad feeling about this'?",
            answerChoices: ["Anakin Skywalker", "Han Solo", "Darth Vader"],
            validAnswer: 2
        ),
        Question(
            label: "What other name did Queen Amidala go by?",
            answerChoices: ["Mara Jade", "Padme", "Jaina", "Leia"],
            validAnswer: 1
        ),
        Question(
            label: "Who was the voice of Yoda?",
            answerChoices: ["Georges Lucas", "Jim Henson", "Frank Oz", "Kevin Clash"],
            validAnswer: 2
        ),
        Question(
            label: "What was the name of Boba Fett's ship?",
            answerChoices: ["Home One", "Icebreaker", "Raven's Claw", "Slave I"],
            validAnswer: 3
        ),
        Question(
            label: "Harrison Ford got the part of Han Solo by doing what?",
            answerChoices: [
                "Acting as a stand-in for auditions for the film",
                "Sending George Lucas a gift basket filled with chocolate and wine",
                "Hiring a PR firm to advocate on his behalf"
            ],
            validAnswer: 0
        ),
        Question(
            label: "What does a Jedi crave not, according to Yoda?",
            answerChoices: ["Adventure and excitement", "Faith and hope", "Peace and understanding"],
            validAnswer: 0
        ),
        Question(
            label: "Who played the voice of Darth Vader?",
            answerChoices: ["Morgan Freeman", "Samuel L. Jackson", "James Earl Jones", "Harisson Ford"],
            validAnswer: 2
        ),
        Question(
            label: "Who did actress Carrie Fisher admit to having an affair with while filming the first Star Wars movie?",
            answerChoices: ["Georges Lucas", "Mark Hammil", "Harrison Ford", "Alec Guiness"],
            validAnswer: 2
        ),
        Question(
            label: "Who played Darth Maul?",
            answerChoices: ["Ray Park", "Sam Neal", "Ewan McGregor"],
            validAnswer: 0
        ),
        Question(
            label: "What animal did Han Solo slice open to keep Luke Skywalker warm on Hoth?",
            answerChoices: ["Womp Rat", "Wookie", "Ewok", "Tauntaun"],
            validAnswer: 3
        ),
        Question(
            label: "What was the Empire based off of?",
            answerChoices: ["Nazi Germany", "Communist Russia", "The Japanese Empire"],
            validAnswer: 0
        ),
        Question(
            label: "Which character didn't originally appear in A New Hope, but was added in digitally for the film's re-release?",
            answerChoices: ["Yoda", "Jabba the Hut", "The Ewoks"],
            validAnswer: 1
        ),
        Question(
            label: "How many theaters did Star Wars: Episode IV open in originally?",
            answerChoices: ["12", "105", "38", "43"],
            validAnswer: 3
        ),
        Question(
            label: "How many Academy Award nominations did Star Wars episode IV earn for acting?",
            answerChoices: ["1", "7", "12", "3"],
            validAnswer: 1
        ),
        Question(
            label: "Who was the voice of Jar Jar Binks?",
            answerChoices: ["Frank Oz", "Ahmad Best", "James Earl Jones"],
            validAnswer: 1
        ),
        Question(
            label: "Which Star Wars actor had a bit part in Apocalypse Now?",
            answerChoices: ["Mark Hamill", "Harrison Ford", "Alec Guiness", "Ewan McGrego"],
            validAnswer: 1
        ),
        Question(
            label: "How does most Star Wars movies begin?",
            answerChoices: ["With an opening crawl of dialogue", "With an opening slot on Tatooine", "With a monologue from a Jedi"],
            validAnswer: 0
        ),
        Question(
            label: "Which actor was so excited to use a lightsaber that he made his own sound effects during fight scenes?",
            answerChoices: ["Liam Neeson", "Ray Park", "Samuel L. Jackson", "Ewan McGregor"],
            validAnswer: 3
        ),
        Question(
            label: "Which actor played Lando Calrissian",
            answerChoices: ["Billy Dee Williams", "Jim Brown", "Morgan Freeman"],
            validAnswer: 0
        ),
        Question(
            label: "Which character was originally supposed to die at the end of Empire Strikes Back?",
            answerChoices: ["Chewbaca", "Han", "Luke", "Leia"],
            validAnswer: 1
        ),
        Question(
            label: "Who first comes to save Han from Jabba the Hut but is captured and enslaved?",
            answerChoices: ["Yoda", "Luke", "Leia", "Lando"],
            validAnswer: 2
        ),
        Question(
            label: "What is Han Solo frozen in at the end of The Empire Strikes Back?",
            answerChoices: ["Carbonite", "Detonite", "Dry Ice", "Cold Steel"],
            validAnswer: 0
        ),
        Question(
            label: "Which Golden Girls Actress starred in the Star Wars Holiday Special?",
            answerChoices: ["Betty White", "Bea Arthur", "Estelle Getty"],
            validAnswer: 1
        ),
        Question(
            label: "Which Star Wars movie is not rated PG?",
            answerChoices: ["Empire Strikes Back", "Return of the Jedi", "Revenge of the Sith"],
            validAnswer: 2
        ),
        Question(
            label: "Which actor almost played the voice of Darth Vader?",
            answerChoices: ["Orson Welles", "Marlon Brando", "Al Pacino"],
            validAnswer: 0
        ),
        Question(
            label: "What country was used for the location shots on Planet Hoth?",
            answerChoices: ["Finland", "Sweeden", "Russia", "Norway"],
            validAnswer: 3
        ),
        Question(
            label: "What country served as the location for Tatooine?",
            answerChoices: ["Egypt", "Somalia", "Tunisia", "Maroco"],
            validAnswer: 2
        ),
        Question(
            label: "What type of fighter jets did the rebels use?",
            answerChoices: ["TIE Fighters", "Starfighters", "X-Wings", "AA-Wings"],
            validAnswer: 2
        ),
        Question(
            label: "Which character said, \"These aren’t the droids you're looking for?\"",
            answerChoices: ["Han Solo", "Luke Skywalker", "Obi Wan Kenobi", "Yoda"],
            validAnswer: 2
        ),
        Question(
            label: "Which of the following questions is debated among Star Wars fans?",
            answerChoices: ["Who shot first?", "Who is Luke's father?", "What planet did the Death Star destroy?"],
            validAnswer: 0
        ),
        Question(
            label: "Which of the following actors did NOT play Anakin Skywalker?",
            answerChoices: ["Hayden Christensen", "Jake Lloyd", "Haley Joel Osment"],
            validAnswer: 2
        ),
        Question(
            label: "Alec Guinness had very specific conditions for appearing in the first film. Which of the following did he demand?",
            answerChoices: ["To shoot only for one day", "To have the craft services table filled with only fruits and vegetables", "To keep his lightsaber"],
            validAnswer: 0
        ),
        Question(
            label: "Han Solo ad-libbed his response to Leia when she said, \"I love you.\" What was he supposed to say?",
            answerChoices: ["Ditto, kid", "I don't know why", "I love you too"],
            validAnswer: 2
        ),
        Question(
            label: "What did George Lucas do when he was threatened with having Empire pulled from theaters due to the placement of the credits?",
            answerChoices: ["Moved the credits to the beginning of the film", "Filled a complaint with the MPAA", "Withdrrew his membership from the MPAA, DGA and WGA"],
            validAnswer: 2
        ),
        Question(
            label: "How much did George Lucas sell Lucas film to Disney for?",
            answerChoices: ["$50 million", "$450million", "$4 billion", "$1.5 billion"],
            validAnswer: 2
        ),
        Question(
            label: "Which of the following directors was considered to direct Return of the Jedi?",
            answerChoices: ["David Lynch", "James Cameron", "Quentin Tarantino"],
            validAnswer: 0
        ),
        Question(
            label: "What name was Return of the Jedi given to prevent people from finding out or leaking any information about the film?",
            answerChoices: ["Blue Harvest", "White Flag", "Red Dawn", "Blue Lagoon"],
            validAnswer: 0
        ),
        Question(
            label: "Which movie did people go to just to see the trailer for Phantom Menace?",
            answerChoices: ["There's Something About Marry", "Meet Joe Black", "You've Got Mail"],
            validAnswer: 1
        ),
        Question(
            label: "What word was never spoken during Return of the Jedi?",
            answerChoices: ["Wookie", "Ewok", "Rebel"],
            validAnswer: 1
        ),
        Question(
            label: "Who played Wicket the Ewok?",
            answerChoices: ["Kenny Baker", "Gary Coleman", "Warwick Davis"],
            validAnswer: 2
        ),
        Question(
            label: "What did Verizon have to pay Lucas film for the right to use?",
            answerChoices: ["The word Droid", "The Star Wars logo", "The word lightsaber"],
            validAnswer: 0
        ),
        Question(
            label: "According to Peter Cushing, the boots he was supposed to wear as part of Grand Moff Tarkin's uniform were very uncomfortable. What did he wear instead when his feet would not be visible in a scene?",
            answerChoices: ["Flip Flops", "Sneakers", "Slippers"],
            validAnswer: 1
        ),
        Question(
            label: "Who played Queen Amidala's Decoy in The Phantom Menace?",
            answerChoices: ["Keira Knightly", "Evan Rachel Wood", "Emma Watson"],
            validAnswer: 0
        ),
        Question(
            label: "Who played Queen Amidala's Decoy in The Phantom Menace?",
            answerChoices: ["Walk arround in his costume", "Speak while wearing his costume", "Eat while wearing his costume"],
            validAnswer: 1
        ),
        Question(
            label: "How much was Harrison Ford's \"reward\" for filming A New Hope?",
            answerChoices: ["$10'000", "$100'000", "$50'000", "$250'000"],
            validAnswer: 0
        ),
        Question(
            label: "Who played Emperor Palpatine in Return of the Jedi and Darth Sidious in the three prequels?",
            answerChoices: ["Alec Guiness", "Liam Neeson", "Ian McDiarmid", "Ewan McGrego"],
            validAnswer: 2
        ),
        Question(
            label: "What was Luke Skywalker's last name originally supposed to be?",
            answerChoices: ["Starkiller", "Starblaster", "Stargazer", "Starblade"],
            validAnswer: 0
        ),
        Question(
            label: "What was Yoda originally going to be played by?",
            answerChoices: ["A monkey with a crane", "A robotic tiger", "An animatronic penguin"],
            validAnswer: 0
        ),
        Question(
            label: "Which famous character from another movie franchise (or at least his relatives) can be seen in The Phantom Menace?",
            answerChoices: ["Johny Five", "E.T.", "Xenomorph", "Alf"],
            validAnswer: 1
        ),
        Question(
            label: "Which other film changed its name to avoid confusion with Return of the Jedi?",
            answerChoices: ["Star Trek II: The Wrath of Kahn", "Revenge of the Nerds", "Revenge of the Pink Panther"],
            validAnswer: 0
        ),
        Question(
            label: "What type of prop was carried by an extra as he evacuated Cloud City?",
            answerChoices: ["An ice cream maker", "A salad shooter", "A blender"],
            validAnswer: 0
        ),
        Question(
            label: "R2-D2 wasn't always supposed to communicate through beeps. What language did he originally speak?",
            answerChoices: ["English", "Spanish", "German", "French"],
            validAnswer: 0
        ),
        Question(
            label: "What city was Lando the leader of?",
            answerChoices: ["Endor", "Coruscant", "Mos Eisley", "Cloud City"],
            validAnswer: 3
        ),
        Question(
            label: "Which boy band made an appearance in Star Wars: Episode II- -Attack of the Clones (the scenes were cut from the final version of the film).",
            answerChoices: ["New Kids on the Block", "NSYNC", "Backstreet Boys"],
            validAnswer: 1
        ),
        Question(
            label: "Who played C-3PO?",
            answerChoices: ["Anthony Edwards", "Anthony Daniels", "Edward Norton"],
            validAnswer: 1
        )
    ]
    
    // The question currently selected
    var currentQuestions: [Question]
    
    init(numberOfQuestions: Int) {
        // Make a copy of initial questions to make it easy to remove questions avoiding asking a question twice
        currentQuestions = questions
        
        var randomQuestions: [Question] = []
        
        // Randomize the selection of questions
        for _ in 0..<numberOfQuestions {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: currentQuestions.count)
            randomQuestions.append(currentQuestions.remove(at: randomNumber).randomize())
        }
        
        currentQuestions = randomQuestions
        
        print(currentQuestions.count)
    }
    
    ///
    /// Pick a question randomly with the warranty no question are chosen twice
    /// When there is no more questions available, an error is raised
    ///
    /// @return The chosen question
    ///
    func randomQuestion() -> Question {
        // Pick a question randomly and remove it from the questions to avoid picking a question twice
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: currentQuestions.count)
        return currentQuestions.remove(at: randomNumber)
    }
    
    ///
    /// Check if there is available questions
    ///
    /// @return True if at least one question can be chosen randomly
    ///
    func areQuestionsAvailable() -> Bool {
        return !currentQuestions.isEmpty
    }
}
