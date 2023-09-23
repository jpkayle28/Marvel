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
    private lazy var seriesSection = [Serie]()
    
    var item: (character: MarvelCharacter, comics: [Comic]?, events: [Event]?, series: [Serie]?)? {
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
        setupSeries()
    }
    
    private func populateSections() {
        guard let item = item else { return }
        comicsSection = item.comics ?? []
        eventsSection = item.events ?? []
        seriesSection = item.series ?? []
    }
    
}

// MARK: - Sections Setup
extension CharacterDetailsListingViewModel {
    
    private func setupCharacter() {
        guard let item else { return }
        let characterSection = SectionWithUniqueCell(cellIdentifier: "CharacterCell", data: [item.character])
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
    
    private func setupSeries() {
        guard seriesSection.count > 0 else { return }
        let seriesSectionHeader = SectionBorder("CharacterHeader", height: 80, data: "Series")
        let seriesSection = SectionWithUniqueCell(seriesSectionHeader, cellIdentifier: "EventCell", data: seriesSection)
        addSectionItem(seriesSection)
    }
    
}
