//
//  Habit.swift
//  HabitBuddy
//
//  Created by ivan ruwido  on 23.06.23.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let frequency: String
    let remindMe: Bool
}

