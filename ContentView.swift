import SwiftUI

struct ContentView: View {
  @StateObject private var eventData = EventData()
    var body: some View {
        TabView{ 
            Group{
                Deaper()
                    .tabItem { 
                        Text("Dieper")
                        Image(systemName: "face.smiling")
                    }
                Formula()
                    .tabItem{
                        Text("Formula")
                        Image(systemName: "arrowshape.bounce.right")
                        
                    }
                infoBaby()
                    .tabItem { 
                        Label("InfoBaby", systemImage:"info")
                    }
                EventList(eventData: eventData)
                    .tabItem { 
                        Text("DateBaby")
                        Image(systemName: "calendar.badge.exclamationmark")
                    }
                
            }
            
            
        }
        .accentColor(.blue)
        
            
    }
}
 

