//
//  ContentView.swift
//  HabitBuddy
//
//  Created by ivan ruwido  on 23.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var habits: [Habit] = []
    @State private var showAddHabit = false
    
    var body: some View {
        NavigationView {
            if habits.isEmpty {
                VStack {
                    Text("No habits found")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Button(action: {
                        showAddHabit = true
                    }) {
                        Text("Add a Habit")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            } else {
                List {
                    ForEach(habits) { habit in
                        Text(habit.name)
                    }
                    .onDelete(perform: deleteHabit)
                }
                .navigationBarTitle("Habits")
                .navigationBarItems(trailing: Button(action: {
                    showAddHabit = true
                }) {
                    Image(systemName: "plus")
                })
            }
        }
        .sheet(isPresented: $showAddHabit) {
            AddHabitView(habits: $habits)
        }
    }
    
    private func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

