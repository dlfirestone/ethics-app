//
//  Quote.swift
//  EthiclyShared
//
//  Created by DM on 9/17/26.
//

import Foundation

public struct Quote: Identifiable {
  public let id = UUID()
  public let text: String
  public let author: String?
  public let source: String?
  public let year: Int?
}

public let quoteArray: [Quote] = [
  Quote(
    text: "Love your neighbor as yourself",
    author: nil,
    source: "Leviticus 19:18",
    year: nil
  ),
  Quote(
    text: "Do not accuse anyone for no reason--when they have done you no harm",
    author: nil,
    source: "Proverbs 3:30",
    year: nil
  ),
  Quote(
    text: "Act only according to that maxim whereby you can at the same time will that it should become a universal law,",
    author: "Immanuel Kant",
    source: "Groundwork of the Metaphysics of Morals",
    year: 1785
  ),
  Quote(
    text: "Waste no more time arguing about what a good man should be. Be one.",
    author: "Marcus Aurelius",
    source: "Meditations",
    year: nil
  ),
  Quote(
    text: "The best revenge is to be unlike him who performed the injury.",
    author: "Marcus Aurelius",
    source: "Meditations",
    year: nil
  ),
  Quote(
    text: "No act of kindness, no matter how small, is ever wasted.",
    author: "Aesop",
    source: "The Lion and the Mouse",
    year: nil
  ),
  Quote(
    text: "The ultimate measure of a man is not where he stands in moments of comfort and convenience, but where he stands at times of challenge and controversy.",
    author: "Martin Luther King Jr.",
    source: "Strength to Love",
    year: nil
  ),
  Quote(
    text: "Never doubt that a small group of thoughtful, committed citizens can change the world; indeed, it's the only thing that ever has.",
    author: "Margaret Mead (attributed)",
    source: nil,
    year: nil
  ),
  Quote(
    text: "Character is how you treat those who can do nothing for you.",
    author: "Johann Wolfgang von Goethe (attributed)",
    source: nil,
    year: nil
  ),
  Quote(
    text: "A society grows great when old men plant trees in whose shade they shall never sit.",
    author: "D. Elton Trueblood",
    source: "The Life We Prize",
    year: 1951
  ),
]
