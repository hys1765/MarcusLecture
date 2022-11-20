//
//  PencilViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/30.
//

import UIKit

class PencilViewController: BaseViewControl {
    
    @IBOutlet weak var searchTextField: UITextField!
    let mViewModel = PencilViewModel()
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup(){
        mViewModel.getTest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onClickedSearch(_ sender: Any) {
        let searchText = searchTextField.text!
        if let navigationController = self.navigationController{
            if !(navigationController.topViewController?.description.contains("WebViewController"))!{
            
            }
            
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
