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

	public func register<Cell>(_ cellClass: Cell.Type) where Cell: Identifiable, Cell: UITableViewCell {
		ingredient.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
	}

	public func register<Cell>(_ cellClass: Cell.Type) where Cell: HavingNib, Cell: UITableViewCell {
		ingredient.register(Cell.nib, forCellReuseIdentifier: Cell.identifier)
	}

	public func register<HeaderFooterView>(_ headerFooterClass: HeaderFooterView.Type)
		where HeaderFooterView: Identifiable, HeaderFooterView: UITableViewHeaderFooterView {
		ingredient.register(HeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterView.identifier)
	}

	public func register<HeaderFooterView>(_ headerFooterClass: HeaderFooterView.Type)
		where HeaderFooterView: HavingNib, HeaderFooterView: UITableViewHeaderFooterView {
			ingredient.register(HeaderFooterView.nib, forCellReuseIdentifier: HeaderFooterView.identifier)
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
