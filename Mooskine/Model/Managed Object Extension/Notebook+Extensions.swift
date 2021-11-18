//
//  Notebook+Extensions.swift
//  Mooskine
//
//  Created by 嶋田省吾 on 2021/11/17.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData


//Setting creationDate during initialization
extension Notebook {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
