//
//  EmployeeView.swift
//  CoreDataReleationships
//
//  Created by Frédéric Helfer on 31/10/22.
//

import SwiftUI

struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
            Text("Date Joined: \(entity.dateJoined ?? Date())")
            
            Text("Business:")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department:")
                .bold()
            
            Text(entity.department?.name ?? "")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

//struct EmployeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeView()
//    }
//}
