class Context {
    var register: (View) -> () = { _ in }
    var remove: () -> () = { }
}

let context = Context()
