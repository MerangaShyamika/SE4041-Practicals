import SwiftUI

// Practical 04 guided exercises.
// The lab sheet replaces ContentView at each step; here every step is kept as its
// own view so you can open it from the "Exercises" button in the app or the Xcode canvas.

struct ExercisesMenuView: View {
    var body: some View {
        List {
            NavigationLink("01 – First SwiftUI View") { Exercise01View() }
            NavigationLink("02 – View Modifiers") { Exercise02View() }
            NavigationLink("03 – Stacks & SF Symbols") { Exercise03View() }
            NavigationLink("04 – @State and Buttons") { Exercise04View() }
            NavigationLink("05 – TextField and Binding") { Exercise05View() }
            NavigationLink("Mini Activity – Result Input") { MiniActivityView() }
            NavigationLink("06/07 – Model and List") { Exercise07View() }
            NavigationLink("08 – Navigation") { Exercise08View() }
        }
        .navigationTitle("Exercises")
    }
}

// Exercise 01 – Your First SwiftUI View
struct Exercise01View: View {
    var body: some View {
        Text("Welcome to SE4041")
    }
}

// Exercise 02 – View Modifiers (+ modifier-order experiment)
struct Exercise02View: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to SE4041")
                .font(.title)
                .bold()
                .foregroundStyle(.blue)
                .padding()

            // padding THEN background -> orange covers the padding
            Text("SE4041")
                .padding()
                .background(.orange)

            // background THEN padding -> orange only behind the text
            Text("SE4041")
                .background(.orange)
                .padding()
        }
    }
}

// Exercise 03 – Building Layouts with Stacks + SF Symbols
struct Exercise03View: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            Text("SE4041")
                .font(.largeTitle)
                .bold()

            Text("Mobile Application Design & Development")

            HStack {
                Text("Practical 04")
                Spacer()
                Text("SwiftUI")
            }
            .padding()

            HStack(spacing: 24) {
                Image(systemName: "person.fill")
                Image(systemName: "book.fill")
                Image(systemName: "star.fill")
                    .foregroundStyle(.orange)
            }
            .font(.largeTitle)
        }
        .padding()
    }
}

// Exercise 04 – @State and Buttons
struct Exercise04View: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Button tapped \(count) times")
                .font(.title2)

            Button("Tap Me") {
                count += 1
            }
            .buttonStyle(.borderedProminent)

            Button("Reset") {
                count = 0
            }
        }
        .padding()
    }
}

// Exercise 05 – TextField and Binding
struct Exercise05View: View {
    @State private var name = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Student Registration")
                .font(.title)
                .bold()

            TextField("Enter student name", text: $name)
                .textFieldStyle(.roundedBorder)

            if name.isEmpty {
                Text("Enter your name above")
            } else {
                Text("Welcome, \(name)")
            }
        }
        .padding()
    }
}

// Mini Activity – Student Result Input
struct MiniActivityView: View {
    @State private var studentName = ""
    @State private var mark = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Student Name", text: $studentName)
                .textFieldStyle(.roundedBorder)

            TextField("Mark", text: $mark)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Show Result") {
                // No action required for this activity
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

// Exercises 06 & 07 – Model and List (pass/fail colours)
struct Exercise07View: View {
    @State private var students = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {
        List(students) { student in
            HStack {
                Text(student.name)
                Spacer()
                Text("\(student.mark)")
                    .bold()
                    .foregroundStyle(student.passed ? Color.green : Color.red)
            }
        }
    }
}

// Exercise 08 – Navigation
struct Exercise08View: View {
    @State private var students = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {
        List(students) { student in
            NavigationLink {
                StudentDetailView(student: student)
            } label: {
                HStack {
                    Text(student.name)
                    Spacer()
                    Text("\(student.mark)")
                }
            }
        }
        .navigationTitle("SE4041 Marks")
    }
}

#Preview("Exercise 03") {
    Exercise03View()
}

#Preview("Exercise 04") {
    Exercise04View()
}

#Preview("Exercise 08") {
    NavigationStack {
        Exercise08View()
    }
}
