//
//  EthiclyWidgetBundle.swift
//  EthiclyWidget
//
//  Created by DM on 9/16/26.
//

import WidgetKit
import SwiftUI

@main
struct EthiclyWidgetBundle: WidgetBundle {
    var body: some Widget {
        EthiclyWidget()
        EthiclyWidgetControl()
        EthiclyWidgetLiveActivity()
    }
}
