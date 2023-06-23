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
    @State private var habitFrequency = ""
    @State private var remindMe = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Habit Name", text: $habitName)
                    TextField("Frequency", text: $habitFrequency)
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
            let newHabit = Habit(name: habitName, frequency: habitFrequency, remindMe: remindMe)
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
