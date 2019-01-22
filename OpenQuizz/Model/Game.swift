//
//  Game.swift
//  OpenQuizz
//
//  Created by ISABELLE Terwagne on 16/01/2019.
//  Copyright © 2019 ISABELLE Terwagne. All rights reserved.
//

import Foundation

class Game {
    var score = 0
    var scoreIncrease = false
    private var questions = [Question]()
    private var currentIndex = 0
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    func refresh() {
        score = 0
        scoreIncrease = false
        currentIndex = 0
        state = .over
        
        
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)        }
    }
    func answerCurrentQuestion(with answer: Bool) {
        scoreIncrease = false
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
            scoreIncrease = true
        }
        goToNextQuestion()
        
    }
    
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }
    
    private func finishGame() {
        state = .over
    }
    
    private func receiveQuestions(_ questions: [Question]) {
        self.questions = questions
        state = .ongoing
    }
}

