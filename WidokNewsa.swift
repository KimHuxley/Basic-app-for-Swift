import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let request: URLRequest
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct WidokNewsa: View {
    let url: String
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: url)!))
    }
}
