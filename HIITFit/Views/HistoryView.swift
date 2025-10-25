//
//  HistoryView.swift
//  HIITFit
//
//  Created by Reginald Coleman on 10/3/25.
//

import SwiftUI

struct HistoryView: View {
  @Binding var showHistory: Bool

  let today = Date()
  let yesterday = Date().addingTimeInterval(-86400)
  
  //  let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
  // let exercises2 = ["Squat", "Step Up", "Burpee"]
  @EnvironmentObject var history : HistoryStore
  var body: some View {
    ZStack (alignment: .topTrailing) {
      Button(action: { showHistory.toggle() }){
        Image(systemName: "xmark.circle")
      }
      .font(.title)
      .padding()
      VStack{
        Text("History")
          .font(.title)
          .padding()
        
        Form {
          ForEach(history.exerciseDays) { day in
            Section(
              header:
                Text(day.date.formatted(as: "MMM d"))
                .font(.headline)) {
                  ForEach(day.exercises, id: \.self) { exercise in
                    Text(exercise)
                  }
                }
          }
        }
      }
    }
  }
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environmentObject(HistoryStore())
}
