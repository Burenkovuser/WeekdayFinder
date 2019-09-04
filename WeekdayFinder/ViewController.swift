//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Vasilii on 04/09/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func findDay() {
        
        // определяем календарь
        let calendar = Calendar.current
        
        // определяем компоненеты даты, которые нам нужны
        var dateComponetnts = DateComponents()
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        dateComponetnts.day = Int(day)
        dateComponetnts.month = Int(month)
        dateComponetnts.year = Int(year)
        
        /*
        dateComponetnts.day = Int(dateTF.text!)
        dateComponetnts.month = Int(monthTF.text!)
        dateComponetnts.year = Int(yearTF.text!)
 */
        
        //создаем дату по нашему по календарю и компанентам
        guard let date = calendar.date(from: dateComponetnts) else { return }
        
        // выбираем полное наименование дня недели из таблицы дат "EEEE"
        let dateForatter = DateFormatter()
        dateForatter.locale = Locale(identifier: "ru_RU")
        
        dateForatter.dateFormat = "EEEE"
        
        let weekday = dateForatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized //при переходе на русский первая бува маленькая, деаем ее заглавной
        
        resultLabel.text = capitalizedWeekday
    }
    
    // если редактирование закончилось, клавиатура должна уйти с экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

