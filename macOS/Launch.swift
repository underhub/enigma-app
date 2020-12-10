import AppKit

final class Launch: NSView {
    private(set) weak var new: Control.Title!
    
    required init?(coder: NSCoder) { nil }
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        let title = Text(.systemFont(ofSize: 20, weight: .black))
        title.stringValue = NSLocalizedString("Enigma", comment: "")
        addSubview(title)
        
        let new = Control.Title(NSLocalizedString("New Game", comment: ""), background: .systemBlue, foreground: .white)
        addSubview(new)
        self.new = new
        
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        new.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        new.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
