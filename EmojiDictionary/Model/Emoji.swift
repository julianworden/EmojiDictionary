//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Julian Worden on 5/23/22.
//

import Foundation

struct Emoji: Codable {
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Saved_Emoji").appendingPathExtension("json")
    static var sampleEmojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
     ]

    private(set) var symbol: String
    private(set) var name: String
    private(set) var description: String
    private(set) var usage: String

    static func saveToFile(emojis: [Emoji]) {
        let encoder = JSONEncoder()

        if let jsonData = try? encoder.encode(emojis) {
            try? jsonData.write(to: Emoji.archiveURL, options: .noFileProtection)
        }
    }

    static func loadFromFile() -> [Emoji] {
        let decoder = JSONDecoder()
        if let emojiData = try? Data(contentsOf: Emoji.archiveURL),
           let decodedData = try? decoder.decode([Emoji].self, from: emojiData) {
            return decodedData
        }
        return Emoji.sampleEmojis
    }
}
