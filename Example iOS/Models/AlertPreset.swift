import UIKit

struct AlertPreset {
    
    var name: String
    var title: String
    var message: String?
    var preset: SPAlertIconPreset
    
    var id: String {
        return name
    }
}
