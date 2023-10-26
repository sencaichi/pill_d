import SwiftUI
import SwiftData
import Foundation


@Model
public class Dose: Identifiable {
    @Attribute(.unique) public var id: UUID
    public var dateTime: Date
    @Relationship var medication: Medication?

    init(id: UUID = .init(), dateTime: Date = .init(), medication: Medication?) {
        self.dateTime = dateTime
        self.id = id
        self.medication = medication
        }

}
