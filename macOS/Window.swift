import AppKit

final class Window: NSWindow {
    init() {
        super.init(contentRect: .init(x: 0, y: 0, width: 1200, height: 800), styleMask:
            [.borderless, .closable, .miniaturizable, .resizable, .titled, .unifiedTitleAndToolbar, .fullSizeContentView],
                   backing: .buffered, defer: false)
        minSize = .init(width: 800, height: 500)
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        toolbar = .init()
        toolbar!.showsBaselineSeparator = false
        collectionBehavior = .fullScreenNone
        isReleasedWhenClosed = false
        center()
        setFrameAutosaveName("Window")
        
        launch()
    }
    
    override func close() {
        super.close()
        NSApp.terminate(nil)
    }
    
    private func launch() {
        contentView!.subviews.forEach { $0.removeFromSuperview() }
        
        let launch = Launch()
        launch.new.target = self
        launch.new.action = #selector(game)
        contentView!.addSubview(launch)
        
        launch.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true
        launch.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true
        launch.leftAnchor.constraint(equalTo: contentView!.leftAnchor).isActive = true
        launch.rightAnchor.constraint(equalTo: contentView!.rightAnchor).isActive = true
    }
    
    @objc private func game() {
        contentView!.subviews.forEach { $0.removeFromSuperview() }
        
        let game = Game()
        contentView!.addSubview(game)
        
        game.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true
        game.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true
        game.leftAnchor.constraint(equalTo: contentView!.leftAnchor).isActive = true
        game.rightAnchor.constraint(equalTo: contentView!.rightAnchor).isActive = true
    }
}
