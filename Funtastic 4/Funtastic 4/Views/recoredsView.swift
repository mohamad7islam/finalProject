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
        let records = userDefaults.object(forKey: "myKey") as? [String]
        let p1 = records![0]
        let p2 = records![1]
        Text("\(p1)" )
        Text("\(p2)" )
    }
}

struct recoredsView_Previews: PreviewProvider {
    static var previews: some View {
        recoredsView()
    }
}
