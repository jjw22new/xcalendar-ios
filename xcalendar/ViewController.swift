//
//  ViewController.swift
//  xcalendar
//
//  Created by Jung JaeYeol on 2020/04/06.
//  Copyright © 2020 Jung JaeYeol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let mCalendar = Calendar.current
    var mDate = Date()
    
    @IBAction func btnPrevMonthClick(_ sender: Any) {
        mDate = mCalendar.date(byAdding: .month, value: -1, to: mDate)!
        lbCurrentMonth.text = String(mCalendar.component(.month, from: mDate)) + "월"
        cvCalendar.reloadData()
    }
    
    @IBOutlet weak var lbCurrentMonth: UILabel!
    
    @IBAction func btnNextMonthClick(_ sender: Any) {
        mDate = mCalendar.date(byAdding: .month, value: 1, to: mDate)!
        lbCurrentMonth.text = String(mCalendar.component(.month, from: mDate)) + "월"
        cvCalendar.reloadData()
    }
    
    @IBOutlet weak var cvCalendar: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cvCalendar.delegate = self
        cvCalendar.dataSource = self
        
        lbCurrentMonth.text = String(mCalendar.component(.month, from: mDate)) + "월"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 * (1 + 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let startDay = mCalendar.component(.weekday, from: mDate.startOfMonth()) // 월 시작 요일
        let lastDay = mCalendar.component(.day, from: mDate.endOfMonth()) // 월 마지막 날짜
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell

        switch indexPath.row {
        case 0:
            cell.lbCalendarDay.text = "일"
        case 1:
            cell.lbCalendarDay.text = "월"
        case 2:
            cell.lbCalendarDay.text = "화"
        case 3:
            cell.lbCalendarDay.text = "수"
        case 4:
            cell.lbCalendarDay.text = "목"
        case 5:
            cell.lbCalendarDay.text = "금"
        case 6:
            cell.lbCalendarDay.text = "토"
        default:
            if(indexPath.row < startDay + 7 - 1 || indexPath.row > lastDay + 7 + 2) {
                cell.lbCalendarDay.text = ""
            } else {
                cell.lbCalendarDay.text = String(indexPath.row - 7 - startDay + 2)
            }
        }
        
        return cell
    }
}

