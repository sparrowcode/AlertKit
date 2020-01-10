import UIKit
import SPAlert

class ViewController: UITableViewController {
    
    let data: [Alert] = [
        Alert(key: "Done", preset: .done, title: "Added to Library", subtitle: nil),
        Alert(key: "Heart", preset: .heart, title: "Love", subtitle: "We'll recommend more like this for you"),
        Alert(key: "Doc", preset: .doc, title: "Document saved", subtitle: "See in folder new file"),
        Alert(key: "Bookmark", preset: .bookmark, title: "Added to bookmark", subtitle: "See bookmarks screen"),
        Alert(key: "Moon", preset: .moon, title: "Night Mode", subtitle: "You can disable it in settings"),
        Alert(key: "Star", preset: .star, title: "Added to favorite", subtitle: nil),
        Alert(key: "Flag", preset: .flag, title: "Message Flaged", subtitle: nil),
        Alert(key: "Exclamation", preset: .exclamation, title: "Oops", subtitle: "Something went wrong"),
        Alert(key: "Question", preset: .question, title: "Oops", subtitle: "Form not complete"),
        Alert(key: "Message", preset: .message, title: "Message sended", subtitle: "You can check history"),
        Alert(key: "Bolt", preset: .bolt, title: "Power", subtitle: "Now turned on"),
        Alert(key: "Eject", preset: .eject, title: "Eject complete", subtitle: nil),
        Alert(key: "Card", preset: .card, title: "Payment sent", subtitle: "Thanks for donate"),
        Alert(key: "Cart", preset: .cart, title: "Add to order", subtitle: "It wait in cart"),
        Alert(key: "Like", preset: .like, title: "Thanks for feedback", subtitle: "It helped us"),
        Alert(key: "Dislike", preset: .dislike, title: "Thanks for feedback", subtitle: "It helped us"),
        Alert(key: "Privacy", preset: .privacy, title: "Privacy accepted", subtitle: "You privacy it important"),
        Alert(key: "Rotate", preset: .rotate, title: "Portrait mode", subtitle: "You can change it in settings"),
        Alert(key: "Search", preset: .search, title: "Searching", subtitle: "Maybe need other title"),
        Alert(key: "Add", preset: .add, title: "Added to Folder", subtitle: nil),
        Alert(key: "Error", preset: .error, title: "Oops", subtitle: "Please try again later"),
        Alert(key: "Shuffle", preset: .shuffle, title: "Songs Shuffled", subtitle: nil),
        Alert(key: "Repeat", preset: .repeat, title: "Songs Repeat", subtitle: nil),
        Alert(key: "Message", preset: nil, title: nil, subtitle: "Email required")
    ]
    
    var selectedIndexPath: IndexPath {
        willSet {
            tableView.cellForRow(at: self.selectedIndexPath)?.accessoryType = .none
        }
        didSet {
            if let cell = tableView.cellForRow(at: selectedIndexPath) {
                cell.accessoryType = .checkmark
            }
        }
    }
    
    init() {
        selectedIndexPath = IndexPath(row: 0, section: 0)
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .plain)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SPAlert"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .play, target: self, action: #selector(self.showAlert))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    /**
     Show now. Call when tap on nav-bar item.
     */
    @objc func showAlert() {
        let alertData = data[selectedIndexPath.row]
        if let preset = alertData.preset {
            SPAlert.present(title: alertData.title ?? "Here title", message: alertData.subtitle, preset: preset)
        } else {
            SPAlert.present(message: alertData.subtitle ?? "Empty")
        }
    }
    
    /**
     Alert preview data.
     
     - parameter key: Visible ID in table view.
     - parameter preset: Preset for `SPAlert`.
     - parameter title: Title in `SPAlert`. Optional only for `.message` preset.
     - parameter subtitle: Optional subtitle in `SPAlert`.
     */
    typealias Alert = (key: String, preset: SPAlertPreset?, title: String?, subtitle: String?)
}

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].key
        cell.accessoryType = (indexPath == selectedIndexPath) ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose preset"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "You can pass your image or animatable view. See Readme for more details."
    }
}
