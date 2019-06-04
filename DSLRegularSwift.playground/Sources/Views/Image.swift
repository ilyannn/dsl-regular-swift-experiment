public class Image: View {
    let name: String
    let attributes: [String]

    @discardableResult public init(name: String, attributes: [String] = []) {
        self.name = name
        self.attributes = attributes
        super.init()
    }

    private func add<T>(attributeName: String, value: T) -> Image {
        context.remove()
        return Image(name: name, attributes: attributes + ["\(attributeName)='\(String(describing: value))'"])
    }

    public enum Color {
        case yellow
    }

    public enum Scale {
        case medium
    }

    public func foregroundColor(_ color: Color) -> Image {
        return add(attributeName: "foregroundColor", value: color)
    }

    public func imageScale(_ scale: Scale) -> Image {
        return add(attributeName: "scale", value: scale)
    }

    public func size(_ size: Int) -> Image {
        return add(attributeName: "size", value: size)
    }
}
