//
//  DetailView.swift
//  H4X0R News
//
//  Created by Jastin Martinez on 3/9/21.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(url: url)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
            .previewLayout(.sizeThatFits)
    }
}


