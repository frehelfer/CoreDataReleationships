//
//  ViewModel.swift
//  CoreDataReleationships
//
//  Created by Frédéric Helfer on 29/10/22.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            businesses = try manager.moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.moc)
        newBusiness.name = "Microsoft"
        
        newBusiness.departments = [departments[0], departments[1]]
        
        newBusiness.employees = [employees[1]]
        
        save()
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.moc)
        newDepartment.name = "Engineering"
//        newDepartment.businesses = [businesses[0]]
        
        newDepartment.addToEmployees(employees[1])
        
        save()
    }
    
    func addEmployees() {
        let newEmployee = EmployeeEntity(context: manager.moc)
        newEmployee.name = "Tany"
        newEmployee.age = 32
        newEmployee.dateJoined = Date()
        
//        newEmployee.business = businesses[0]
//        newEmployee.department = departments[0]
        
        save()
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}
