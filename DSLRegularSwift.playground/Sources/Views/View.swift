public typealias Builder = () -> ()

typealias BuildSubviews = () -> [View]

open class View {
    let buildSubviews: BuildSubviews

    @discardableResult public init(builder: @escaping Builder = { }) {
        buildSubviews = {
            let pushedRegister = context.register
            let pushedRemove = context.remove
            var subviews: [View] = []
            context.register = { subview in
                subviews.append(subview)
            }
            context.remove = { subviews.removeLast() }
            builder()
            context.register = pushedRegister
            context.remove = pushedRemove
            return subviews
        }
        context.register(self)
    }
}
