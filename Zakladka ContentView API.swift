
import SwiftUI
import URLImage

struct Result : Codable {
    var articles: [Article]
}
struct Article: Codable {
    var url: String
    var title: String
    var description: String?
    var urlToImage: String?
}
struct ZakladkaContentView: View {
    private let url = "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=10a8277bfc224405823d92e25066b1c4"
    @State private var articles = [Article]()
    
    var body: some View {
        NavigationView {
            List(articles, id: \.url){item in
                NavigationLink(destination: WidokNewsa(url: item.url)){
                HStack(alignment: .top){
                    URLImage(( URL(string:item.urlToImage ??
                                    "https://picsum.photos/100")
                                    ?? nil
                                    )!){
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.frame(width: 100.0, height: 100.0)
                    
                
                VStack(alignment: .leading){
                    Text(item.title)
                        .font(.headline)
                    Text(item.description ?? "")
                        .font(.footnote)
                }
                }
                }
            } .onAppear(perform: fetchData)
                .navigationTitle("Wiadomości")
        }
        
    }
    func fetchData(){
        guard let url = URL(string: url) else {
            print("URL nieosiagalne")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let data = data {
                if let decodedResult = try?
                    JSONDecoder().decode(Result.self, from: data){
                    DispatchQueue.main.async {
                        self.articles = decodedResult.articles
                    }
                    return
                }
            }
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
