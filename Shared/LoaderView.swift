//
//  LoaderView.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation
import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading...")
            .foregroundColor(isFailed ? .red : .green)
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}
