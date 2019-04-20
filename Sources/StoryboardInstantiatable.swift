//
//  StoryboardInstantiatable.swift
//  SQITools
//
//  Created by Shane Qi on 4/10/17.
//  Copyright © 2017 Shane Qi. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable {

    static var storyboardName: String { get }

    static func getInstance() -> Self

}

public extension StoryboardInstantiatable {

    /// By default, the storyboard name should be the view controller class name trimming the last 
    /// 14 characters (usually `ViewController`).
    /// For example, if the view controller is named as `AbcViewController`, the stroyboard of it
    /// can only be named as `Abc`, in order to be found.
    static var storyboardName: String {
        let className = String(describing: Self.self)
        let suffixBeginIndex = className.index(className.endIndex, offsetBy: -14)
        return String(className.prefix(upTo: suffixBeginIndex))
    }

    /// The view controller must be the initial view controller of the storyboard.
    /// In order to adopt this default implementation, the view controller must be a `final class`.
    ///
    /// - Returns: the view controller instance inited from storyboard.
    static func getInstance() -> Self {
        guard let viewController =  UIStoryboard(name: Self.storyboardName, bundle: nil)
            .instantiateInitialViewController() as? Self else {
            fatalError("Failed to init the view controller.")
        }
        return viewController
    }

}
