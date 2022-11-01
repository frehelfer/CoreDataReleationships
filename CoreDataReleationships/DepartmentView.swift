//
//  DepartmentView.swift
//  CoreDataReleationships
//
//  Created by Frédéric Helfer on 31/10/22.
//

import SwiftUI

struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let bussinesses = entity.businesses?.allObjects as? [BusinessEntity] {
                 Text("Bussinesses:")
                    .bold()
                ForEach(bussinesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                ForEach(employees) { employes in
                    Text(employes.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

//struct DepartmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DepartmentView()
//    }
//}
