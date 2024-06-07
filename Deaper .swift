import SwiftUI

struct Deaper: View {
    @State var items : [itemModel] = [
        itemModel(title: "Diaper "),
        itemModel(title: "Wipes or moistened cotton balls"),
        itemModel(title: "Diaper rash ointment")
    ]
    
    var isComplete: Bool{
        items.allSatisfy{$0.isCompleted || $0.title.isEmpty}
    }
    
   
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    Text("List of necessary materials")
                        .padding()
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    ScrollView{  
                        
                        
                        Text("First, wash your hands. Then gather your supplies. Make sure you have everything you need in arm's reach (but out of your baby's reach) so you won't have to turn your back while your baby is on the changing table.")
                            .padding()
                    }
                    List{
                        ForEach($items){
                            item in listRowView(item: item)
                        }
                    }
                    
                    
                    Spacer()
                    if isComplete {
                        NavigationLink("Start"){
                            StepDeaper(
                                title: "Take Off the Dirty Diaper",
                                img: "005",
                                text: "Gently lay your baby on his back on the changing surface.\n\nLoosen the flaps or pins of the diaper on each side.\n\nThen lift your child's bottom of the diaper, gently holding the ankles and lifting them slightly. If there is a lot of feces in the diaper, you can use the upper half of the diaper to gently sweep it towards the lower half.\n\nSlide the diaper away. Put it nearby, but out of your baby's reach",
                                titleBar: "First step"
                            )
                            
                            NavigationLink("Second Step"){
                                StepDeaper(
                                    title: "Clean Your Baby's Skin",
                                    img: "001",
                                    text: "Clean your baby. Thoroughly but gently clean the diaper area with wipes or moistened cotton balls\n\n(Attention) When cleaning a vulva, always go from front to back to avoid infection. Note that you are only cleaning the outer area of a vulva to remove any poop. Likewise, be sure to clean completely around a penis and scrotum.\n\nIn addition, to avoid peeing, put a clean diaper or cloth over the penis while cleaning the diaper area.\n\nLeave the trash aside. Put any used disposable cleaning material on top of the dirty diaper",
                                    titleBar: "Second Step"
                                )
    
                                        NavigationLink("Third Step"){
                                            StepDeaper(
                                                title: "Put on the Clean Diaper",
                                                img:"002",
                                                text: "Before closing the diaper, be sure to point a penis down to avoid peeing out of the diaper.\n\nApply any ointments or creams you choose to use as a prevention or treatment of rashes.\n\nDoing this step after putting the new diaper under your baby will help prevent you from having to clean the ointments from the changing surface.\n\n(Although since a diaper change clamp, experts, including the American Academy of Pediatrics (AAP), do not recommend the use of baby powder due to the health risks associated with the inhalation of particles in the Pull forward between your child's legs and up over the stomach. )\n\nPull the diaper flaps open and forward, making sure that the diaper is comfortable, but not too tight. ",
                                                titleBar: "Third step"
                                            )
                                            
                                            
                                            
                                            
                                            
                                        }
                                        .padding(10)
                                        .frame(width:200)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(15, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        
                                        
                                        
                                        
                                    }
                                    .padding(10)
                                    .frame(width:200)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(15, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                .padding(10)
                                .frame(width:150)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                
                            }
                    Spacer()
                            
                        }.navigationTitle("Chager to Diaper")
                        
                        
                  Spacer()      
            }
                    
                
                    
        }
                
    }
        
        
}

struct Dieper_Previews: PreviewProvider {
    static var previews: some View {
        Deaper()
    }
}




