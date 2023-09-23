//
//  SectionsListingViewModel+TableViewExtension.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

extension SectionsListingViewModel {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if var cellSafe = cell as? SectionUIExpandedProtocol {
            cellSafe.expanded = sections[indexPath.section].expandSection
        }
        return cell
    }
}

// MARK: - Section Headers

extension SectionsListingViewModel {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard  let header = sectionHeaderAtSection(section) else {
            return nil
        }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: header.sectionBorderIdentifier)
        if let viewSafe = view as? BaseAnyObjectHandler {
            viewSafe.setupDelegate(self)
        }
        if let viewSafe = view as? HeaderAndFooterUIProtocol {
            viewSafe.updateUILayoutItem(header.uiItem)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let viewSafe = view as? BaseDataViewProtocol, let header = sectionHeaderAtSection(section)  {
            viewSafe.setupData(header.data)
            view.tintColor = header.sectionBorderTintColor
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let header = sectionHeaderAtSection(section) else {
            return 0
        }
        return header.height
    }
}

// MARK: - Section Footers

extension SectionsListingViewModel {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard  let footer = sectionFooterAtSection(section) else {
            return nil
        }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: footer.sectionBorderIdentifier)
        if let viewSafe = view as? BaseAnyObjectHandler {
            viewSafe.setupDelegate(self)
        }
        if let viewSafe = view as? HeaderAndFooterUIProtocol {
            viewSafe.updateUILayoutItem(footer.uiItem)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let footer = sectionFooterAtSection(section)  else {
            return 0.01
        }
        return footer.height
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let viewSafe = view as? BaseDataViewProtocol, let footer = sectionHeaderAtSection(section)  {
            viewSafe.setupData(footer.data)
            view.tintColor = footer.sectionBorderTintColor
        }
    }
}
