//
//  MenuViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/11/21.
//

import UIKit

class MenuViewController: UIViewController {
    var coordinator: MenuCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = MenuTableView()
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
