import SwiftUI

struct listRowView: View {
    
    @Binding var item: itemModel
    
    
    var body: some View {
        HStack{
            Button{
                item.isCompleted.toggle()
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
                    .foregroundColor(item.isCompleted ? .blue : .black)
            }
            
            Text(item.title)
            
        }
    }
}

    
