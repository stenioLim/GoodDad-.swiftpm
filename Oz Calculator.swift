import SwiftUI

struct Formula: View {
    
    let bottleMl = [30,60,90,120,150,180]
    @State var bottle = 30
    
    var ounces: String{
        let result = 30
        return(bottle/result).formatted()
    }
    
    var body: some View {
        
        VStack{
            VStack{
                
                VStack{
                    Text("Ounces:  \(ounces)")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                .padding()
                .frame(maxWidth:.infinity)
                .background(.blue)
                .background(in: RoundedRectangle(cornerRadius: 15))
                .shadow(color:.cyan, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.9)
                .padding()
                
                Form{
                    Section("Ounces"){
                        Picker("Ounce", selection: $bottle){
                            ForEach(bottleMl, id: \.self){
                                Text("\($0)ML")
                            }
                        }
                        
                        
                    }
                    
                } .pickerStyle(.wheel)
                
                
                
                
            }
            
        }
        
        
        
        
        
        
        
        
    }
}

struct Formula_Previews: PreviewProvider {
    static var previews: some View {
        Formula()
    }
}
