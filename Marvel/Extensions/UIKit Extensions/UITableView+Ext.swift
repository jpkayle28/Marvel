//
//  UITableView+Ext.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

extension UITableView {
    
    func registerCells(_ cells: [String]) {
        cells.forEach { cell in
            registerSingleCell(cell)
        }
    }
    
    func registerSingleCell(_ cell: String) {
        self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }
    
    func registerMultipleSectionsFooters(_ sectionsFooters: [String]) {
        sectionsFooters.forEach { headerFooter in
            registerSingleSectionFooter(headerFooter)
        }
    }
    
    func registerSingleSectionFooter(_ sectionFooter: String) {
        let nib = UINib(nibName: sectionFooter, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: sectionFooter)
    }
    
    func reloadSection(_ section: Int, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        reloadSections(IndexSet(integer: section), with: animation)
        after?()
        endUpdates()
    }
    
    func reloadSingleRow(_ indexPath: IndexPath, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        reloadMultipleRows([indexPath], before: before, after: after, animation: animation)
    }
    
    func reloadMultipleRows(_ indexPaths: [IndexPath], before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        reloadRows(at: indexPaths, with: animation)
        after?()
        endUpdates()
    }
    
    func insertSection(_ section: Int, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        insertSections(IndexSet.init(integer: section), with: animation)
        after?()
        endUpdates()
    }
    
    func deleteSection(_ section: Int, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        deleteSections(IndexSet.init(integer: section), with: animation)
        after?()
        endUpdates()
    }
    
    func deleteRow(_ indexPath: IndexPath, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        deleteRows(at: [indexPath], with: animation)
        after?()
        endUpdates()
    }
    
    func insertRow(_ indexPath: IndexPath, before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        insertRows([indexPath], before: before, after: after, animation: animation)
    }
    
    func insertRows(_ indexPathes: [IndexPath], before: (() -> Void)? = nil, after: (() -> Void)? = nil, animation: UITableView.RowAnimation = .fade) {
        beginUpdates()
        before?()
        insertRows(at: indexPathes, with: animation)
        after?()
        endUpdates()
    }
    
    func visibleCellAtIndexPath<T:UITableViewCell>(_ indexPath: IndexPath, type: T.Type) -> T? {
        guard let visibleIndices = self.indexPathsForVisibleRows,
              visibleIndices.contains(indexPath),
              let cellSafe = self.cellForRow(at: indexPath) as? T else { return nil }
        return cellSafe
    }
    
}
