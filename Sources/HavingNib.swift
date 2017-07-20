//
//  HavingNib.swift
//  SQITools
//
//  Created by Shane Qi on 5/26/17.
//  Copyright © 2017 Shane Qi. All rights reserved.
//

import UIKit

public protocol HavingNib: Identifiable {

	static var nibName: String { get }
	static var nib: UINib { get }

}

public extension HavingNib {

	static var nibName: String { return identifier }
	static var nib: UINib { return UINib(nibName: nibName, bundle: Bundle(for: Self.self)) }

}
