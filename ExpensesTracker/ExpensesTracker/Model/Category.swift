//
//  Category.swift
//  ExpensesTracker
//
//  Created by Josh Tai on 10/17/23.
//

import UIKit
import SwiftUI
import SwiftData

@Model
class Category
{
    var categoryname: String
    
    // Relationship macro: if a category is deleted, then expenses under it will also be deleted.
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    
    var expenses: [Expense]?
    
    init(categoryname: String)
        {
        self.categoryname = categoryname
        }
    
}
