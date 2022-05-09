//
//  DetailImages.swift
//  GayNYC
//
//  Created by Sam Landa on 5/8/22.
//

import SwiftUI

struct DetailImages: View {
    var detailImage1: Image
    var detailImage2: Image
    var detailImage3: Image
    var detailImage4: Image
    
    var body: some View {
        ScrollView {
            VStack {
                detailImage1
                    .resizable()
                .scaledToFit()
            
                Text("What it looks like today")
                    .font(.caption)
                detailImage2
                    .resizable()
                    .scaledToFit()
                Text("Caption: Placholder image 2")
                    .font(.caption)
                detailImage3
                    .resizable()
                    .scaledToFit()
                Text("Caption: Placeholder image 3")
                    .font(.caption)
                detailImage4
                    .resizable()
                    .scaledToFit()
                Text("Caption: Placeholder image 4")
                    .font(.caption)
            }
        }
    }
}

struct DetailImages_Previews: PreviewProvider {
    static var previews: some View {
        DetailImages(detailImage1: Image("stonewall1"), detailImage2: Image("stonewall2"), detailImage3: Image("stonewall3"), detailImage4: Image("stonewall4"))
    }
}
