// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import SparrowKit
import SPDiffable
import SPAlert

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
        configureDiffable(sections: content, cellProviders: SPDiffableTableDataSource.CellProvider.default)
        
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
                SPAlert.present(
                    title: preset.title,
                    message: preset.message,
                    preset: preset.preset,
                    completion: nil
                )
                
                if preset.preset == SPAlertIconPreset.spinner {
                    delay(2, closure: {
                        SPAlert.dismiss()
                    })
                }
                
            }), menu: nil),
            .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        ]
    }
    
    // MARK: - Data
    
    fileprivate var presets: [AlertPresetModel] {
        return [
            .init(
                name: "Done",
                title: "Added to Library",
                message: nil,
                preset: .done
            ),
            .init(
                name: "Error",
                title: "Oops",
                message: "Please try again later",
                preset: .error
            ),
            .init(
                name: "Heart",
                title: "Love",
                message: "We'll recommend more like this for you",
                preset: .heart
            ),
            .init(
                name: "Spinner (Loading)",
                title: "Please, wait",
                message: "It take some time",
                preset: .spinner
            ),
            .init(
                name: "Custom Image",
                title: "Custom Image",
                message: "Passed UIImage object for preset with style custom.",
                preset: .custom(UIImage.init(systemName: "pencil.and.outline")!.withRenderingMode(.alwaysTemplate))
            ),
        ]
    }
    
    // MARK: - Diffable
    
    var currentPreset: AlertPresetModel? {
        didSet {
            self.diffableDataSource?.set(content, animated: false)
        }
    }
    
    var content: [SPDiffableSection] {
        let items = presets.map { (preset) -> SPDiffableTableRow in
            return SPDiffableTableRow(
                text: preset.name,
                accessoryType: (preset.id == currentPreset?.id) ? .checkmark : .none,
                selectionStyle: .none) { [weak self] _,_  in
                    guard let self = self else { return }
                    self.currentPreset = preset
            }
        }
        return [
            SPDiffableSection(id: "presets", header: nil, footer: nil, items: items)
        ]
    }
}
