import SwiftUI

// Final Practical Task – Student Marks App ("SE4041 Marks")
struct ContentView: View {

    // Part B – State Variables
    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    @State private var errorMessage = ""

    // Part G – Passed Student Count (updates automatically)
    private var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
            VStack(spacing: 12) {

                // Part C – Input Interface
                VStack(alignment: .leading, spacing: 8) {
                    Text("Student Name")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)

                    Text("Mark")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    TextField("Mark", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }

                Button {
                    addStudent()
                } label: {
                    Label("Add Student", systemImage: "person.badge.plus")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }

                Text("Passed Students: \(passedCount)")
                    .font(.headline)
            }
            .padding()

            // Part E – Student List
            List(students) { student in
                // Part F – Navigate to detail screen
                NavigationLink {
                    StudentDetailView(student: student)
                } label: {
                    StudentRow(student: student)
                }
            }
            .listStyle(.plain)
            .overlay {
                if students.isEmpty {
                    Text("No students added yet")
                        .foregroundStyle(.secondary)
                }
            }
            }
            .navigationTitle("SE4041 Marks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ExercisesMenuView()
                    } label: {
                        Label("Exercises", systemImage: "list.bullet.rectangle")
                    }
                }
            }
        }
    }

    // Part D – Add a Student (with validation)
    private func addStudent() {
        let trimmedName = studentName.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty else {
            errorMessage = "Please enter a student name."
            return
        }

        guard let mark = Int(markText.trimmingCharacters(in: .whitespaces)) else {
            errorMessage = "Please enter a whole-number mark."
            return
        }

        guard mark >= 0 && mark <= 100 else {
            errorMessage = "Mark must be between 0 and 100."
            return
        }

        let student = Student(name: trimmedName, mark: mark)
        students.append(student)

        studentName = ""
        markText = ""
        errorMessage = ""
    }
}

// Reusable row subview
struct StudentRow: View {
    let student: Student

    var body: some View {
        HStack {
            Image(systemName: student.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(student.passed ? Color.green : Color.red)

            Text(student.name)

            Spacer()

            Text("\(student.mark)")
                .bold()
                .foregroundStyle(student.passed ? Color.green : Color.red)

            // Text label as well, so the result does not rely on colour only
            Text(student.passed ? "Pass" : "Fail")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
