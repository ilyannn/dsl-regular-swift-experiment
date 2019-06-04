public class NavigationBarTitle: View {

}

public class NavigationView: View {

}

public class List: View {

}

public class HStack: View {

}

public class Text: View {
    let string: String

    @discardableResult public init(_ string: String) {
        self.string = string
        super.init()
    }

    @discardableResult public init(verbatim string: String) {
        self.string = string
        super.init()
    }
}

public class Toggle: View {
    let isOn: Bool

    @discardableResult public init(isOn: Bool, builder: @escaping Builder) {
        self.isOn = isOn
        super.init(builder: builder)
    }
}

public class NavigationButton: View {

}

public class Spacer: View {

}
