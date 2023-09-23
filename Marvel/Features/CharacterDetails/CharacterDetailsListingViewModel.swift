//
//  CharacterDetailsListingViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class CharacterDetailsListingViewModel: SectionsListingViewModel {
    
    private lazy var comicsSection = [Comic]()
    private lazy var eventsSection = [Event]()
    
    var item: (character: MarvelCharacter, comics: [Comic]?, events: [Event]?)? {
        didSet {
            populateSections()
            setupComponents()
        }
    }
    
    override var cellIdentifiers: [String]? {
        return ["CharacterCell", "ComicCell", "EventCell"]
    }
    
    override var headerIdentifiers: [String]? {
        return ["CharacterHeader"]
    }
    
    override func updateUIFromDataAtIndexPath(_ indexPath: IndexPath) -> Any? {
        return itemAtIndexPath(indexPath)
    }
    
    private func setupComponents() {
        setupCharacter()
        setupComics()
        setupEvents()
    }
    
    private func populateSections() {
        guard let item = item else { return }
        comicsSection = item.comics ?? []
        eventsSection = item.events ?? []
    }
    
}

// MARK: - Sections Setup
extension CharacterDetailsListingViewModel {
    
    private func setupCharacter() {
        let characterSection = SectionWithUniqueCell(cellIdentifier: "CharacterCell", data: [item?.character])
        addSectionItem(characterSection)
    }
    
    private func setupComics() {
        guard comicsSection.count > 0 else { return }
        let comicsSectionHeader = SectionBorder("CharacterHeader", height: 80, data: "Comics")
        let comicSection = SectionWithUniqueCell(comicsSectionHeader, cellIdentifier: "ComicCell", data: comicsSection)
        addSectionItem(comicSection)
    }
    
    private func setupEvents() {
        guard eventsSection.count > 0 else { return }
        let eventsSectionHeader = SectionBorder("CharacterHeader", height: 80, data: "Events")
        let eventSection = SectionWithUniqueCell(eventsSectionHeader, cellIdentifier: "EventCell", data: eventsSection)
        addSectionItem(eventSection)
    }
    
}
