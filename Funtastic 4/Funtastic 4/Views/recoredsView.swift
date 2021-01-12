//
//  recoredsView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI
import Foundation

struct recoredsView: View {
    var body: some View {
        let strings = userDefaults.object(forKey: "myKey") as? [String]
        let p1 = strings![0]
        Text("\(p1)" )    }
}

struct recoredsView_Previews: PreviewProvider {
    static var previews: some View {
        recoredsView()
    }
}
