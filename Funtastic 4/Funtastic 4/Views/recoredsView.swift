//
//  recoredsView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI
import Foundation

struct recoredsView: View {
    func actionSheet( S : String) {
        let data = String(S)
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    init() {
        self.records = userDefaults.object(forKey: "myKey") as? [String]
    }
    @State var records = userDefaults.object(forKey: "myKey") as? [String]
    var body: some View {
        List {
            ForEach(records!, id: \.self) { record in
                Text(record).onLongPressGesture( perform: {actionSheet(S: record + " Shared via Funtastic 4 ™ app")})
            }.onAppear(perform: {
                records = userDefaults.object(forKey: "myKey") as? [String]
            })
        }.navigationTitle("Records")
    }
}

struct recoredsView_Previews: PreviewProvider {
    static var previews: some View {
        recoredsView()
    }
}
