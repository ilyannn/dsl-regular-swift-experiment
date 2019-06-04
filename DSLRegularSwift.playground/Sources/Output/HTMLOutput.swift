public protocol Output {
    associatedtype Result
    func output(view: View) -> Result
}

public struct HTMLOutput: Output {

    public func output(view: View) -> String {
        return "<html>\n\(build(view: view))"
    }

    private func build(view: View) -> String {
        var subviews = view.buildSubviews()

        let prefix: String
        let subitemPrefix: String
        let suffix: String

        switch view {
        case let text as Text:
            return "<p>\(text.string)</p>"
        case let toggle as Toggle:
            prefix = "<toggle on='\(toggle.isOn.description)'>"
            subitemPrefix = ""
            suffix = "</toggle>"
        case is List:
            prefix = "\n<ul>"
            subitemPrefix = "\n<li>"
            suffix = "\n</ul>"
        case is HStack:
            prefix = "\n<div direction='horizontal'>"
            subitemPrefix = ""
            suffix = "</div>"
        case let image as Image:
            let attributeDescription = (["ref='\(image.name).jpg'"] + image.attributes).joined(separator: " ")
            return "<img \(attributeDescription)/>"
        case is Spacer:
            return "<space/>"
        case is NavigationView:
            let title = subviews.first { $0 is NavigationBarTitle } ?? Text("")
            subviews = subviews.filter { !($0 is NavigationBarTitle) }
            prefix = "<title>\(build(view: title))</title>\n<body>"
            subitemPrefix = ""
            suffix = "</body>"
        default:
            prefix = ""
            subitemPrefix = ""
            suffix = ""
        }

        let main = ([prefix] + subviews.map(build)).joined(separator: subitemPrefix)
        return main + suffix
    }

    public init() {
        // nothing to do
    }
}
