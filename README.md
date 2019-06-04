# DSL in regular Swift (an experiment)

An experiment where we develop a DSL for a **regular Swift 5** to write

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

    ...
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

and give as an example an output into "HTML-like language"

```
<html>
<title><p>Landmarks</p></title>
<body>
<ul>
<li><toggle on='false'><p>Show Favorites Only</p></toggle>
<li>
<div direction='horizontal'><img ref='turtlerock.jpg' size='50'/><p>Turtle Rock</p><space/><img ref='star.fill.jpg' scale='medium' foregroundColor='yellow'/></div>
<li>
<div direction='horizontal'><img ref='silversalmoncreek.jpg' size='50'/><p>Silver Salmon Creek</p><space/></div>
<li>
<div direction='horizontal'><img ref='chilkoottrail.jpg' size='50'/><p>Chilkoot Trail</p><space/><img ref='star.fill.jpg' scale='medium' foregroundColor='yellow'/></div>
<li>
<div direction='horizontal'><img ref='stmarylake.jpg' size='50'/><p>St. Mary Lake</p><space/><img ref='star.fill.jpg' scale='medium' foregroundColor='yellow'/></div>
<li>
<div direction='horizontal'><img ref='twinlake.jpg' size='50'/><p>Twin Lake</p><space/></div>
<li>
<div direction='horizontal'><img ref='lakemcdonald.jpg' size='50'/><p>Lake McDonald</p><space/></div>
<li>
<div direction='horizontal'><img ref='charleyrivers.jpg' size='50'/><p>Charley Rivers</p><space/></div>
<li>
<div direction='horizontal'><img ref='icybay.jpg' size='50'/><p>Icy Bay</p><space/></div>
<li>
<div direction='horizontal'><img ref='rainbowlake.jpg' size='50'/><p>Rainbow Lake</p><space/></div>
<li>
<div direction='horizontal'><img ref='hiddenlake.jpg' size='50'/><p>Hidden Lake</p><space/></div>
<li>
<div direction='horizontal'><img ref='chincoteague.jpg' size='50'/><p>Chincoteague</p><space/></div>
<li>
<div direction='horizontal'><img ref='umbagog.jpg' size='50'/><p>Lake Umbagog</p><space/></div>
</ul></body>

```

Tested with Xcode 10.2.1
