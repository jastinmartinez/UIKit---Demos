//
//  WebView.swift
//  H4X0R News
//
//  Created by Jastin Martinez on 3/9/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let _url = url {
            if let __url = URL(string: _url)
            {
                let request = URLRequest(url: __url)
                uiView.load(request)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "")
    }
}
