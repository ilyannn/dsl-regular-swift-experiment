// Model

enum Category: String, Codable, Hashable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}

struct Landmark: Hashable, Codable {
    var name: String
    var category: Category
    fileprivate var imageName: String
    var state: String
    var park: String
    var isFavorite: Bool
}

struct UserData {
    let showFavoritesOnly: Bool
    let landmarks: [Landmark]
}

// View

class LandmarkList: View {

    @discardableResult
    init(userData: UserData) {
        super.init {
            NavigationView {
                List {
                    Toggle(isOn: userData.showFavoritesOnly) {
                        Text("Show Favorites Only")
                    }

                    for landmark in userData.landmarks {
                        if !userData.showFavoritesOnly || landmark.isFavorite {
                            NavigationButton() {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                }

                NavigationBarTitle {
                    Text("Landmarks")
                }
            }
        }
    }
}

class LandmarkRow: View {
    
    @discardableResult
    init(landmark: Landmark) {
        super.init {
            HStack {
                Image(name: landmark.imageName).size(50)
                Text(verbatim: landmark.name)

                Spacer()

                if landmark.isFavorite {
                    Image(name: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

// Example

let landmarkData: [Landmark] = load("landmarkData.json")

let testUserData = UserData(showFavoritesOnly: false, landmarks: landmarkData)
testUserData.landmarks.count

let testList = LandmarkList(userData: testUserData)
let htmlOutput = HTMLOutput()
let output = htmlOutput.output(view: testList)
print(output)
