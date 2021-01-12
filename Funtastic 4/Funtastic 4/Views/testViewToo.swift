//
//  testViewToo.swift
//  Funtastic 4
//
//  Created by mohamad on 1/11/21.
//

import SwiftUI
import Foundation

// Access Shared Defaults Object

struct testViewToo: View {
    var body: some View {
        let strings = userDefaults.object(forKey: "myKey") as? [String]
        let p1 = strings![0]
        let p2 = strings![1]
        Text("\(p1) Vs \(p2)" )
    }
}

struct testViewToo_Previews: PreviewProvider {
    static var previews: some View {
        testViewToo()
    }
}
