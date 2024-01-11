//
//  ViewController.swift
//  AnyObject
//
//  Created by Alena on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    @IBOutlet weak var deleteOutletButton: UIButton!
    
    
    @IBOutlet weak var switchStackView: UISwitch!
    
    @IBOutlet weak var labelStackView: UILabel!
    
    @IBOutlet weak var labelSliderOutlet: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var dataPickerOutlet: UIDatePicker!
    
    @IBOutlet weak var labelDataPickerOutlet: UILabel!
    
    @IBOutlet weak var textFieldd: UITextField!
    
    @IBOutlet weak var buttonTextField: UIButton!
    
    var velue = 0
    var valueForAdding = 5
    var count = 0
    var timer: Timer?
    var alarmDate = 0.0
    var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelStackView.textColor = .blue.withAlphaComponent(0.25)
        
    }
    //valueForAdding = Int(sliderOutlet.value)
    
  //  if switchStackView.isOn {
        
   //     velue -= valueForAdding    //присваеваю к знаению velue + valueForAdding=5
  //      labelOutlet.text = "У вас сейчас \(velue) очков"  // с каждим нажатием кнопки будет в лейбле добавлятся +5
        
//    } else {
  //      velue += valueForAdding
 //       labelOutlet.text = "У вас сейчас \(velue) очков"
  //  }
//}

    @IBAction func buttonActionTextFild(_ sender: UIButton) {
        
        labelOutlet.text = "У вас сейчас \(textFieldd.text!) очков"
        
        
        
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        if sender.title(for: .normal) == "Start" {
            sender.setTitle("Stop", for: .normal)
            count = Int(self.alarmDate) - Int(Date().timeIntervalSince1970)
            createTimer()
        } else {
            sender.setTitle("Start", for: .normal)
            
        }
    }
    
    
    @IBAction func dataPickerAction(_ sender: UIDatePicker) {
        alarmDate = sender.date.timeIntervalSince1970
    }
    
    @IBAction func deleteActionButton(_ sender: UIButton) {
        
        //labelOutlet.text = "У вас сейчас \(velue) очков"
        //buttonOutlet.setTitle("добавить \(valueForAdding) очков", for: .normal)
        showAlert()
    }
    
    func updateCounter(){
        
    }
    @objc func finish() {
        showAlert()
    }
    
    func showAlert() {
        let alertContoller = UIAlertController(title: "Ви хотите сбросить все?", message: "продолжить", preferredStyle: .alert)
        
        let deleteAll = UIAlertAction(title: "да", style: .default) { _ in //создаю кнопку да
            self.resetData() //действие для кнопки
        }
        
        alertContoller.addAction(deleteAll) // добавляю созданую кнопку в алерт
        
        let cancelAction = UIAlertAction(title: "отмена", style: .cancel, handler: nil) //создаю кнопку отмена
        
        alertContoller.addAction(cancelAction) //использовать константу
        
        present(alertContoller, animated: true)
        
    }
    
    
    @IBAction func swichActionStackView(_ sender: UISwitch) {
        if sender.isOn {
            labelStackView.textColor = .blue
            buttonOutlet.setTitle(" отнять \(valueForAdding) очков", for: .normal)
            segmentedControlOutlet.setTitle("-5", forSegmentAt: 0)
            segmentedControlOutlet.setTitle("-10", forSegmentAt: 1)
            segmentedControlOutlet.setTitle("-50", forSegmentAt: 2)
            segmentedControlOutlet.setTitle("-100", forSegmentAt: 3)
            segmentedControlOutlet.setTitle("-1000", forSegmentAt: 4)
            
            sliderOutlet.value = -Float(labelSliderOutlet.text ?? "")!
            labelSliderOutlet.text = "\(sliderOutlet.value)"
        } else {
            labelStackView.textColor = .blue.withAlphaComponent(0.25)
            buttonOutlet.setTitle(" добавить \(valueForAdding) очков", for: .normal)
            segmentedControlOutlet.setTitle("+5", forSegmentAt: 0)
            segmentedControlOutlet.setTitle("+10", forSegmentAt: 1)
            segmentedControlOutlet.setTitle("+50", forSegmentAt: 2)
            segmentedControlOutlet.setTitle("+100", forSegmentAt: 3)
            segmentedControlOutlet.setTitle("+1000", forSegmentAt: 4)
            sliderOutlet.value = -Float(labelSliderOutlet.text ?? "")!
            labelSliderOutlet.text = String(-Float(labelSliderOutlet.text ?? "")!)
//labelSliderOutlet через точку обращаемся к тексту лейбла, тексть переводим чере разворот ?? в значение -Float. берем все в дужки и переводим сново в стринг так ми добавили во Float минус
        }
    }
    
    //open var value: Float
    
    @IBAction func buttonAction(_ sender: Any) {
        valueForAdding = Int(sliderOutlet.value)
        
        if switchStackView.isOn {
            
            velue += valueForAdding    //присваеваю к знаению velue + valueForAdding=5
            labelOutlet.text = "У вас сейчас \(velue) очков"  // с каждим нажатием кнопки будет в лейбле добавлятся +5
            
        } else {
            velue += valueForAdding
            labelOutlet.text = "У вас сейчас \(velue) очков"
        }
    }
    
    @IBAction func slider(_ sender: UISlider) {
        //   поменялі значение в свитче по слайдеру (отрицание включить или виключить)
        if sender.value > 0 {
            switchStackView.setOn(false, animated: true)
        } else {
            switchStackView.setOn(true, animated: true)
        }
      segmentedControlOutlet.selectedSegmentIndex = UISegmentedControl.noSegment
        labelSliderOutlet.text = String(sender.value.rounded())//в лейбл слайдера задаю техт что показиваєт значение слайдера и перевожу его в стринг .rounded-убираю цифри после точки
        buttonOutlet.setTitle("добавить \(sender.value.rounded())", for: .normal)
        //обновляю значение кнопки через значение добавляю через точку (функцию) setTitle и в его параметрах задаю состояния "добавить \(sender.value.rounded(передаю в кнопку значение slider ))"
        labelOutlet.text = "У вас сейчас \(valueForAdding) очков"
        
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {  //обращаюсь к sender через точку к индексу сегмент контролера в свиче по индексу задаю значение. через valueForAdding значение подтягивается в лейбл
        case 0 :
            
            valueForAdding = switchStackView.isOn ? -5 : 5
            labelSliderOutlet.text = switchStackView.isOn ? "-5" : "5"
            
//            if switchStackView.isOn {
//                valueForAdding = -5
//                labelSliderOutlet.text = "-5"
//            } else {
//                valueForAdding = 5
//                labelSliderOutlet.text = "5"
//            }
//            valueForAdding = 5
//            labelSliderOutlet.text = "5" // индекс 0 задаю значение 5 что отображается в лейбле слайдер аотлет
            sliderOutlet.setValue(Float(5), animated: true) //слайдер аотлет через точку задаю значение setValue
        case 1 :
            valueForAdding = switchStackView.isOn ? -10 : 10
            labelSliderOutlet.text = switchStackView.isOn ? "-10" : "10"
            sliderOutlet.setValue(Float(10), animated: true)
        case 2 :
            valueForAdding = switchStackView.isOn ? -50 : 50
            labelSliderOutlet.text = switchStackView.isOn ? "-50" : "50"
            sliderOutlet.setValue(Float(50), animated: true)
        case 3 :
            valueForAdding = switchStackView.isOn ? -100 : 100
            labelSliderOutlet.text = switchStackView.isOn ? "-100" : "100"
            sliderOutlet.setValue(Float(100), animated: true)
        case 4 :
            valueForAdding = switchStackView.isOn ? -1000 : 1000
            labelSliderOutlet.text = switchStackView.isOn ? "-1000" : "1000"
            sliderOutlet.setValue(Float(1000), animated: true)
        default: return
        }
        if switchStackView.isOn {
            buttonOutlet.setTitle("отнять \(valueForAdding) очков", for: .normal)
            //в границе видимости segmentedControlAction обращаюсь в Кнопке через точку вибираю свойство setTitle. задаю текст отображения и указиваю канкатанацией valueForAdding тем самим перелаю данние valueForAdding
        } else {
            buttonOutlet.setTitle("добавить \(valueForAdding) очков", for: .normal)
        }
        
        
    }
    func createTimer() { // метод где ми будем работать с таймером
        
        // когда запускаєм єтот метод таймер автоматически запускаєтся интервал 1 сек: вичетается 1 и когда она доходит ло 0 таймер останавливается
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] _ in
            
            if self.count == 0 {
                self.stopTimer()
                self.velue += valueForAdding    //присваеваю к знаению velue + valueForAdding=5
                self.labelOutlet.text = "У вас сейчас \(velue) очков"
                start.setTitle("Start", for: .normal)
            } else {
                self.count -= 1
                self.labelDataPickerOutlet.text = "\(self.count)"
                self.velue -= valueForAdding
                //self.labelOutlet.text = "У вас сейчас \(velue) очков"
            }
            
        })
    }
    
    
    func stopTimer() {
        timer?.invalidate()
    }
}

extension ViewController {
    
    func resetData() { // єта функция удаляет все кнопкой "да", удаляет все к чему обращаюсь
        labelOutlet.text = "у вас нет очков"
        velue = 0
        valueForAdding = 5
        buttonOutlet.setTitle("добавить \(valueForAdding) очков", for: .normal)
        segmentedControlOutlet.selectedSegmentIndex = 0
        sliderOutlet.value = 5.0
        labelSliderOutlet.text = "5"
        switchStackView.isOn = false
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField{
        case textFieldd: return validator.hasNumber(text: string)
        default: break
        }
        return true
        
    }
}
struct Validator {
    let numbers = "1234567890"
    
    func hasNumber(text:String) -> Bool {
        for number in numbers {
            if text.contains(number) { return true }
            }
            return false
        }
}
