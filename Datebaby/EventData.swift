import SwiftUI
//#-learning-task(eventData)

/*#-code-walkthrough(4.eventData)*/
class EventData: ObservableObject {
    /*#-code-walkthrough(4.eventData)*/
    /*#-code-walkthrough(4.events)*/
    @Published var events: [Event] = [
        Event(symbol: "cart",
              color: Color.red.rgbaColor,
              title: "Buy baby things",
              tasks: [EventTask(text: "Diapers"),
                      EventTask(text:"Ointment for diaper rash"),
                      EventTask(text: "Baby formula"),
                      EventTask(text: "Wet wipes"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
        
        Event(symbol: "heart.text.square.fill",
              color: Color.indigo.rgbaColor,
              title: "Consultation with pediatrician",
              tasks: [EventTask(text: "Bring medical ID"),
                      EventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        Event(symbol: "leaf.fill",
              color: Color.green.rgbaColor,
              title: "Nature walk",
              tasks: [EventTask(text: "Tent to sleep"),
                      EventTask(text: "Repellent"),
                      EventTask(text: "Baby formula"),
                      EventTask(text: "Food for 4 meals"),
                      EventTask(text: "Diapers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        Event(symbol: "graduationcap.fill",
              color: Color.primary.rgbaColor,
              title: "First day of study at home",
              tasks: [
                  EventTask(text: "Notebooks"),
                  EventTask(text: "Pencils"),
                  EventTask(text: "Binder"),
                  EventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 730)),
        Event(symbol: "case.fill",
              color: Color.orange.rgbaColor,
              title: "Travel to Grandma's house",
              tasks: [
                  EventTask(text: "Rent a car"),
                  EventTask(text: "Buy baby's car seat"),
                  EventTask(text: "Search for the best room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
    ]
    /*#-code-walkthrough(4.events)*/
    
    func add(_ event: Event) {
        events.append(event)
    }
        
    func remove(_ event: Event) {
        events.removeAll { $0.id == event.id}
    }
    
    func sortedEvents(period: Period) -> Binding<[Event]> {
        Binding<[Event]>(
            get: {
                self.events
                    .filter { $0.period == period}
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
    /*#-code-walkthrough(4.methods)*/
    
    func getBindingToEvent(_ event: Event) -> Binding<Event>? {
        Binding<Event>(
            get: {
                guard let index = self.events.firstIndex(where: { $0.id == event.id }) else { return Event.delete }
                return self.events[index]
            },
            set: { event in
                guard let index = self.events.firstIndex(where: { $0.id == event.id }) else { return }
                self.events[index] = event
            }
        )
    }
    /*#-code-walkthrough(7.fileURL)*/
    private static func getEventsFileURL() throws -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("events.data")
    }
    /*#-code-walkthrough(7.fileURL)*/
    //#-learning-task(loadFunc)
    func load() {
        do {
            /*#-code-walkthrough(7.loadfileURL)*/
            let fileURL = try EventData.getEventsFileURL()
            /*#-code-walkthrough(7.loadfileURL)*/
            /*#-code-walkthrough(7.loadData)*/
            let data = try Data(contentsOf: fileURL)
            /*#-code-walkthrough(7.loadData)*/
            /*#-code-walkthrough(7.loadDataDecode)*/
            events = try JSONDecoder().decode([Event].self, from: data)
            /*#-code-walkthrough(7.loadDataDecode)*/
            print("Events loaded: \(events.count)")
        } catch {
            /*#-code-walkthrough(7.loadFail)*/
            print("Failed to load from file. Backup data used")
            /*#-code-walkthrough(7.loadFail)*/
        }
    }
    
    //#-learning-task(saveFunc)
    func save() {
        do {
            let fileURL = try EventData.getEventsFileURL()
            /*#-code-walkthrough(8.saveEncode)*/
            let data = try JSONEncoder().encode(events)
            /*#-code-walkthrough(8.saveEncode)*/
            /*#-code-walkthrough(8.saveWrite)*/
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
            /*#-code-walkthrough(8.saveWrite)*/
            print("Events saved")
        } catch {
            /*#-code-walkthrough(8.saveFail)*/
            print("Unable to save")
            /*#-code-walkthrough(8.saveFail)*/
        }
    }
}

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date.now
        }
    }

    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
}
