//
//  UITableView+Cooking.swift
//  Pods
//
//  Created by Shane Qi on 7/20/17.
//
//

import UIKit
import Cooking

extension UITableView: Edible {}

public extension Cooking where Ingredient: UITableView {

	public func dequeueReusableCell<Cell>() -> Cell? where Cell: Identifiable, Cell: UITableViewCell {
		guard let cell = ingredient.dequeueReusableCell(withIdentifier: Cell.identifier) else {
			return nil
		}
		guard let castedCell = cell as? Cell else {
			fatalError("Failed to dequeue a cell of type: \(String(describing: Cell.self)). " +
				"Please check how the cell was registered or check the cell type in interface build.")
		}
		return castedCell
	}

	public func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell
		where Cell: Identifiable, Cell: UITableViewCell {
			let cell = ingredient.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath)
			guard let castedCell = cell as? Cell else {
				fatalError("Failed to dequeue a cell of type: \(String(describing: Cell.self)). " +
					"Please check how the cell was registered or check the cell type in interface build.")
			}
			return castedCell
	}

	public func dequeueReusableHeaderFooterView<HeaderFooterView>() -> HeaderFooterView?
		where HeaderFooterView: Identifiable, HeaderFooterView: UITableViewHeaderFooterView {
			guard let headerFooterView = ingredient.dequeueReusableHeaderFooterView(
				withIdentifier: HeaderFooterView.identifier) else {
					return nil
			}
			guard let castedHeaderFooterView = headerFooterView as? HeaderFooterView else {
				fatalError(
					"Failed to dequeue a header/footer view of type: \(String(describing: HeaderFooterView.self)). " +
					"Please check how the view was registered or check the view type in interface build.")
			}
			return castedHeaderFooterView
	}

}
