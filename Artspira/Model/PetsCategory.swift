//
//  PetsCategory.swift
//  Artspira
//
//  Created by Syed Ahmad  on 24/12/2024.
//

import Foundation
import Foundation

// MARK: - WelcomeElement
struct Category: Codable {
    let pets: String

    enum CodingKeys: String, CodingKey {
        case pets = "Pets"
    }
}

let array: [[String: String]] = [
    ["Pets": "Christmas"],
    ["Pets": "Funny"],
    ["Pets": "Camping"],
    ["Pets": "Mom"],
    ["Pets": "Dad"],
    ["Pets": "Inspirational"],
    ["Pets": "Birthday"],
    ["Pets": "Patriotic"],
    ["Pets": "Sports"],
    ["Pets": "Monograms"],
    ["Pets": "Wedding"],
    ["Pets": "Baby"],
    ["Pets": "Seasonal"],
    ["Pets": "Vintage"]
]
let filenames = [
    "BabyItsColdOutside",
    "BelieveGlobe",
    "BelieveInTheMagicOfChristmas",
    "ChristmasCaloriesDontCount",
    "ChristmasScene",
    "DearSantaDefineGood",
    "DearSantaIAmTooCuteForTheNaughtyList",
    "DearSantaICanExplain",
    "DearSantaItWasTheCat",
    "ElfMonogram",
    "ElfSquad",
    "GangstaWrapper",
    "HaveYourselfAMerryLittleChristmas",
    "HoHoHo",
    "IHaveOCD",
    "IPutOutForSanta",
    "ItsTheMostWonderfulTimeOfTheYear",
    "JingleAllTheWay",
    "JoyLovePeaceBelieveChristmas",
    "JoyToTheWorld",
    "LetItSnow",
    "MerryAndBright",
    "MerryChristmas",
    "MerryChristmasBuffaloPlaid",
    "MerryChristmasCross",
    "MerryChristmasSceneWithSanta",
    "MerryChristmasTree",
    "MerryChristmasTreeWithStars",
    "MerryChristmasTruckBack",
    "MerryChristmasTruckBuffaloPlaid",
    "NaughtyNiceITried",
    "OfficialCookieTester",
    "OhDeerChristmasIsHere",
    "OhHolyNight",
    "OnTheNaughtyListAndIRegretNothing",
    "SantaPleaseStopHere",
    "SantaWhyYouBeJudgin",
    "SnowManFace",
    "TooCuteToWearUglySweaters",
    "WeWishYouAMerryChristmas",
    "YouSeriousClark"
]

let christmasArray = filenames.map { ["Christmas": $0] }
var categories: [String: [String]] = [
    "Christmas": [
        "BabyItsColdOutside",
        "BelieveGlobe",
        "BelieveInTheMagicOfChristmas",
        "ChristmasCaloriesDontCount",
        "ChristmasScene",
        "DearSantaDefineGood",
        "DearSantaIAmTooCuteForTheNaughtyList",
        "DearSantaICanExplain",
        "DearSantaItWasTheCat",
        "ElfMonogram",
        "ElfSquad",
        "GangstaWrapper",
        "HaveYourselfAMerryLittleChristmas",
        "HoHoHo",
        "IHaveOCD",
        "IPutOutForSanta",
        "ItsTheMostWonderfulTimeOfTheYear",
        "JingleAllTheWay",
        "JoyLovePeaceBelieveChristmas",
        "JoyToTheWorld",
        "LetItSnow",
        "MerryAndBright",
        "MerryChristmas",
        "MerryChristmasBuffaloPlaid",
        "MerryChristmasCross",
        "MerryChristmasSceneWithSanta",
        "MerryChristmasTree",
        "MerryChristmasTreeWithStars",
        "MerryChristmasTruckBack",
        "MerryChristmasTruckBuffaloPlaid",
        "NaughtyNiceITried",
        "OfficialCookieTester",
        "OhDeerChristmas"
    ],
    "Pets": [
        "CuteDog",
        "FluffyCat",
        "ParrotTalking",
        "HamsterWheel",
        "FishBowl",
        "TurtleSlow",
        "RabbitCarrotLover",
        "SnakeSlither",
        "HorseRunning",
        "DogPlayingFetch"
    ]
]
