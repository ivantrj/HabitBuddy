//
//  AddHabitView.swift
//  HabitBuddy
//
//  Created by ivan ruwido  on 23.06.23.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var habits: [Habit]
    @State private var habitName = ""
    @State private var frequency: [Bool] = Array(repeating: false, count: 7) // Array representing days of the week
    @State private var remindMe = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Habit Name", text: $habitName)
                    VStack(alignment: .leading) {
                        Text("Frequency")
                        Toggle(isOn: $frequency[0]) {
                            Text("Sunday")
                        }
                        Toggle(isOn: $frequency[1]) {
                            Text("Monday")
                        }
                        Toggle(isOn: $frequency[2]) {
                            Text("Tuesday")
                        }
                        Toggle(isOn: $frequency[3]) {
                            Text("Wednesday")
                        }
                        Toggle(isOn: $frequency[4]) {
                            Text("Thursday")
                        }
                        Toggle(isOn: $frequency[5]) {
                            Text("Friday")
                        }
                        Toggle(isOn: $frequency[6]) {
                            Text("Saturday")
                        }
                    }
                    Toggle("Remind Me", isOn: $remindMe)
                }
            }
            .navigationBarTitle("Add Habit")
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
    }
    
    private var saveButton: some View {
        Button(action: {
            let newHabit = Habit(name: habitName, frequency: frequency, remindMe: remindMe)
            habits.append(newHabit)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Save")
                .bold()
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: .constant([]))
    }
}
