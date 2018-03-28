//
//  InstantiatableFromStoryboard.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/28/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

protocol InstantiatableFromStoryboard {
    static func instantiateFromStoryboard<T : UIViewController>() -> T
}
