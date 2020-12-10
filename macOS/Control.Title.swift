import AppKit

extension Control {
    final class Title: Control {
        override var enabled: Bool {
            didSet {
                if enabled {
                    hoverOff()
                } else {
                    hoverOn()
                }
            }
        }
        
        required init?(coder: NSCoder) { nil }
        init(_ text: String, background: NSColor, foreground: NSColor) {
            super.init()
            wantsLayer = true
            layer!.backgroundColor = background.cgColor
            layer!.cornerRadius = 15
            
            let label = Text(.systemFont(ofSize: 12, weight: .medium))
            label.stringValue = text
            label.textColor = foreground
            addSubview(label)
            
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            rightAnchor.constraint(equalTo: label.rightAnchor, constant: 30).isActive = true
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        }
        
        override func hoverOn() {
            alphaValue = 0.3
        }
        
        override func hoverOff() {
            alphaValue = 1
        }
    }
}
