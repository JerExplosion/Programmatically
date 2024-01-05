//
//  CalendarConstruction.swift
//  GVOSCollection
//
//  Created by Yan Ren on 1/3/23.
//

import UIKit

struct Slot {
    let start: Int
    let end: Int
}

struct CalEvent {
    let start: Int
    let end: Int
    let maxConcurrentEvents: Int
    let colIndex: Int
}

private func createEventView(event: CalEvent, columnWidth: CGFloat) -> UIView {
    let eventView = UIView()
    
    let eventWidth = columnWidth / CGFloat(event.maxConcurrentEvents)
    let eventHeight = CGFloat(event.end - event.start) / 1440.0 // scrollview height

    eventView.frame = CGRect(x: CGFloat(event.colIndex - 1) * eventWidth,
                             y: CGFloat(event.start) / 1440.0,
                             width: eventWidth,
                             height: eventHeight)
    return eventView
}

private func createColumnView(size: CGSize, segregatedSlotsCollection: [[Slot]]) -> UIView {
    let columnView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
    
    for colIndex in 0..<segregatedSlotsCollection.count {
        let nonOverlappingSlotsForColumn = segregatedSlotsCollection[colIndex]
        
        for slotIdx in 0..<nonOverlappingSlotsForColumn.count {
            let currSlot = nonOverlappingSlotsForColumn[slotIdx]
            let currEvent = CalEvent(start: currSlot.start,
                                     end: currSlot.end,
                                     maxConcurrentEvents: segregatedSlotsCollection.count + 1,
                                     colIndex: colIndex + 1)
            let eventView = createEventView(event: currEvent, columnWidth: columnView.frame.size.width)
            columnView.addSubview(eventView)
        }
    }
    return columnView
}

func createScheduleView(frame: CGRect, schedule: [String: [Slot]]) -> UIView {
    let calendarScrollView = UIScrollView()
    calendarScrollView.frame = frame
    
    let contentHeight = 1440.0 // each point represents 1 minute.
    
    calendarScrollView.contentSize = CGSize(width: frame.width, height: frame.height)
    
    let numOfDays = 1 // could be 3, 5, 7 depending on the user settings.
    let columnSize = CGSize(width: (frame.width - 50) / CGFloat(numOfDays), height: contentHeight) // 50 pts for the timestamp display to the left.
    
    let allSlots = schedule["Fri Nov 10 13:15:25 2023 -0500"] ?? [] // as an example of a date string retrieve that day's slots.
    let nonOverlappingSlots = retrieveNonOverlappingSlots(allSlots: allSlots)
    
    let columnView = createColumnView(size: columnSize, segregatedSlotsCollection: nonOverlappingSlots)
    columnView.frame.origin.x = 50 // take into account the leftmost timestamp display.
    
    let timestampDisplayView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: contentHeight)) // mock timestamp view.
    calendarScrollView.addSubview(timestampDisplayView)
    calendarScrollView.addSubview(columnView)
    
    return calendarScrollView
}

fileprivate func retrieveNonOverlappingSlots(allSlots: [Slot]) -> [[Slot]] {
    // TODO: - generate the algorithm
    return [[Slot]]()
}
