import SwiftUI

struct StepDeaper: View {
    
    var title : String
    var img : String
    var text: String
    var titleBar : String
    
    var body: some View {
        
        ScrollView{
            VStack(alignment:.center){
                Text(title)
                    .padding()
                    .font(.title).bold()
                    .foregroundColor(.blue)
                
                Spacer()
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(height:250)
                Text(text)
                    .padding()
                Spacer()
            }.navigationTitle(titleBar)
                
        }
    }
}
struct StepDeaper_Previews: PreviewProvider {
    static var previews: some View {
        StepDeaper(title: "Fisrt Step", img: "11", text: "informacoes gerais", titleBar: "Step number")
    }
}
