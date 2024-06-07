import SwiftUI

struct infoView: View {
    var title : String
    var info : String
    let aviso: String
    
    var body: some View {
        VStack{
            ScrollView{
                
                
                HStack {
                    
                    Text(title)
                        .padding()
                        .font(.title)
                }
                Text(aviso)
                    .padding()
                    .foregroundColor(.red)
                    .background(.yellow)
                    .cornerRadius(9)
                    .font(.footnote)
                Spacer()
                
                Text(info)
                    .padding()
                    .font(.body)
                
                
                
                Spacer()
            }
        }
    }
}

struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            infoView(title: "title", info: "body info", aviso:"...")
            
        }
        
    }
}
