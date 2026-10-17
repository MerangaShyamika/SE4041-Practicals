import SwiftUI

// Part F – Detail Screen
struct StudentDetailView: View {

    let student: Student

    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)

            Text(student.name)
                .font(.largeTitle)
                .bold()

            Text("Mark: \(student.mark)")
                .font(.title2)

            // Additional Challenge – grade
            Text("Grade: \(student.grade)")
                .font(.title3)

            Label(student.passed ? "PASS" : "FAIL",
                  systemImage: student.passed ? "checkmark.seal.fill" : "xmark.octagon.fill")
                .font(.title)
                .bold()
                .foregroundStyle(student.passed ? Color.green : Color.red)

            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(student: Student(name: "Amal", mark: 72))
    }
}
