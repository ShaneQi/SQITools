//
//  UICollectionView+Cooking.swift
//  Pods
//
//  Created by Shane Qi on 7/20/17.
//
//

import UIKit
import Cooking

extension UICollectionView: Edible {}

public extension Cooking where Ingredient: UICollectionView {

	public func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell
		where Cell: Identifiable, Cell: UICollectionViewCell {
			guard let cell = ingredient.dequeueReusableCell(
				withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
					fatalError("Failed to dequeue a cell of type: \(String(describing: Cell.self)). " +
						"Please check how the cell was registered or check the cell type in interface build.")
			}
			return cell
	}

	public func dequeueReusableSupplementaryView<ReusableView>(ofKind kind: String, for indexPath: IndexPath)
		-> ReusableView where ReusableView: Identifiable, ReusableView: UICollectionReusableView {
			guard let reusableView = ingredient.dequeueReusableSupplementaryView(
				ofKind: kind,
				withReuseIdentifier: ReusableView.identifier,
				for: indexPath) as? ReusableView else {
					fatalError("Failed to dequeue a reusable view of type: \(String(describing: ReusableView.self)). " +
						"Please check how the view was registered or check the view type in interface build.")
			}
			return reusableView
	}

}
