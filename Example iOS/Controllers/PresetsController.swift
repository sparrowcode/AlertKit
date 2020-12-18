import UIKit
import SparrowKit
import SPDiffable

class PresetsController: SPDiffableTableController {
    
    // MARK: - Init
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SPAlert Presets"
        
        currentPreset = presets.first!
        setCellProviders(SPDiffableTableCellProviders.default, sections: content)
        
        navigationController?.isToolbarHidden = false
        toolbarItems = [
            .init(image: .system("chevron.down.circle"), primaryAction: .init(handler: { (action) in
                guard let currentPreset = self.currentPreset else {
                    self.currentPreset = self.presets.first
                    return
                }
                guard let index = self.presets.firstIndex(where: { $0.id == currentPreset.id }) else { return }
                self.currentPreset = self.presets[safe: index + 1]
                if self.currentPreset == nil {
                    self.currentPreset = self.presets.first
                }
            })),
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            .init(systemItem: .play, primaryAction: .init(handler: { [weak self] (action) in
                guard let preset = self?.currentPreset else { return }
                SPAlert.present(title: preset.title, message: preset.message, preset: preset.preset, completion: nil)
            }), menu: nil),
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        ]
    }
    
    // MARK: - Data
    
    fileprivate var presets: [AlertPreset] {
        return [
            AlertPreset(
                name: "Done",
                title: "Added to Library",
                message: nil,
                preset: .done
            ),
            AlertPreset(
                name: "Error",
                title: "Oops",
                message: "Please try again later",
                preset: .error
            ),
            AlertPreset(
                name: "Heart",
                title: "Love",
                message: "We'll recommend more like this for you",
                preset: .heart
            ),
            AlertPreset(
                name: "Custom Image",
                title: "Custom Image",
                message: "Passed UIImage object for preset with style custom.",
                preset: .custom(UIImage.init(systemName: "pencil.and.outline")!)
            ),
        ]
    }
    
    // MARK: - Diffable
    
    var currentPreset: AlertPreset? {
        willSet {
            guard let id = self.currentPreset?.id else { return }
            let cell = diffableDataSource?.cell(UITableViewCell.self, for: id)
            cell?.accessoryType = .none
        }
        didSet {
            guard let id = self.currentPreset?.id else { return }
            let cell = diffableDataSource?.cell(UITableViewCell.self, for: id)
            cell?.accessoryType = .checkmark
        }
    }
    
    var content: [SPDiffableSection] {
        let items = presets.map { (preset) -> SPDiffableTableRow in
            return SPDiffableTableRow(
                text: preset.name,
                accessoryType: (preset.id == currentPreset?.id) ? .checkmark : .none,
                selectionStyle: .none) { [weak self] _ in
                    guard let self = self else { return }
                    self.currentPreset = preset
            }
        }
        return [
            SPDiffableSection(identifier: "presets", header: nil, footer: nil, items: items)
        ]
    }
}
