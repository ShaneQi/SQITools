//
//  UIColor+Cooking.swift
//  SQITools
//
//  Created by Shane Qi on 3/22/17.
//  Copyright © 2017 Wedding.com. All rights reserved.
//

import UIKit
import Cooking

public extension UIColor: Edible {}

public extension Cooking where Ingredient: UIColor {

	static func new(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) -> Ingredient {
		let newRed = CGFloat(red)/255
		let newGreen = CGFloat(green)/255
		let newBlue = CGFloat(blue)/255
		return Ingredient.init(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
	}

	func pixel() -> UIImage {
		UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
		let context = UIGraphicsGetCurrentContext()!
		context.saveGState()
		context.setFillColor(ingredient.cgColor)
		context.fill(CGRect(x: 0, y: 0, width: 1, height: 1 ))
		context.restoreGState()
		let image = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()

		return image
	}
	
}
