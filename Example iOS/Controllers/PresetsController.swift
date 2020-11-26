import UIKit
import SparrowKit
import SPDiffable

// Maybe ding toolbar
class PresetsController: SPDiffableTableController {
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SPAlert Presets"
        setCellProviders(SPDiffableTableCellProviders.default, sections: content)
        
        navigationController?.isToolbarHidden = false
        toolbarItems = [
            .init(image: .system("chevron.down.circle.fill"), primaryAction: .init(handler: { (action) in
                #warning("doing next switch")
            })),
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            .init(systemItem: .play, primaryAction: .init(handler: { (action) in
                SPAlert.present(title: "Test", preset: .done)
            }), menu: nil),
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
    }
    
    fileprivate var presets: [AlertPreset] {
        return [
            AlertPreset(name: "Done", preset: .done),
            AlertPreset(name: "Heart", preset: .heart)
        ]
    }
    
    var content: [SPDiffableSection] {
        let items = presets.map { (preset) -> SPDiffableTableRow in
            return SPDiffableTableRow(text: preset.name, accessoryType: .none, selectionStyle: .none) { (_) in
                return
            }
        }
        return [
            SPDiffableSection(identifier: "presets", header: nil, footer: nil, items: items)
        ]
    }
}

struct AlertPreset {
    
    var name: String
    var preset: SPAlertPreset
}
